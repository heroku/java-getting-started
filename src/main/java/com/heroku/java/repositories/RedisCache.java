package com.heroku.java.repositories;

import com.heroku.java.dto.TeacherDTO;
import io.lettuce.core.RedisClient;
import io.lettuce.core.RedisURI;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;
import io.lettuce.core.codec.RedisCodec;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RedisCache<T, J> {
    @Value("${spring.data.redis.host}")
    private String redisHost;

    @Value("${spring.data.redis.port}")
    private int redisPort;

    @Value("${spring.data.redis.username}")
    private String redisUsername;

    @Value("${spring.data.redis.password}")
    private String redisPassword;

    @Bean
    private RedisClient createClient() {
        RedisURI uri = RedisURI.Builder
                .redis(redisHost, redisPort)
                .withSsl(true)
                .withVerifyPeer(false)
                .withAuthentication(redisUsername, redisPassword)
                .build();

        return RedisClient.create(uri);
    }

    @Bean
    public RedisCommands<T, J> redisCommands(RedisClient redisClient) {
        StatefulRedisConnection<T, J> connection = redisClient.connect(new Codec<>());
        return connection.sync();
    }


    private static class Codec<T, J> implements RedisCodec<T, J> {
        @Override
        public T decodeKey(ByteBuffer byteBuffer) {
            try {
                byte[] bytes = new byte[byteBuffer.remaining()];
                byteBuffer.get(bytes);
                ObjectInputStream is = new ObjectInputStream(new ByteArrayInputStream(bytes));
                return (T) is.readObject();
            } catch (Exception e) {
                throw new RuntimeException("Failed to decode key", e);
            }
        }

        @Override
        public J decodeValue(ByteBuffer byteBuffer) {
            try {
                byte[] bytes = new byte[byteBuffer.remaining()];
                byteBuffer.get(bytes);
                ObjectInputStream is = new ObjectInputStream(new ByteArrayInputStream(bytes));
                Object result = is.readObject();

                // Convert arrays back to Lists if necessary
                if (result != null && result.getClass().isArray()) {
                    return (J) new ArrayList<>(Arrays.asList((Object[]) result));
                }

                return (J) result;
            } catch (Exception e) {
                throw new RuntimeException("Failed to decode value", e);
            }
        }

        @Override
        public ByteBuffer encodeKey(T o) {
            try {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                ObjectOutputStream os = new ObjectOutputStream(bytes);
                os.writeObject(o);
                os.flush();
                return ByteBuffer.wrap(bytes.toByteArray());
            } catch (Exception e) {
                throw new RuntimeException("Failed to encode key", e);
            }
        }

        @Override
        public ByteBuffer encodeValue(J o) {
            try {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                ObjectOutputStream os = new ObjectOutputStream(bytes);
                if(o instanceof List<?>) {
                    os.writeObject(((List<?>) o).toArray());
                } else {
                    os.writeObject(o);
                }
                os.flush();
                return ByteBuffer.wrap(bytes.toByteArray());
            } catch (Exception e) {
                throw new RuntimeException("Failed to encode value", e);
            }
        }
    }
}
