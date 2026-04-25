package com.heroku.java;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Instant;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(GettingStartedApplication.class)
class GettingStartedApplicationTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private DataSource dataSource;

    @Test
    void indexReturnsOk() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"));
    }

    @Test
    void databaseReturnsRecords() throws Exception {
        Connection connection = org.mockito.Mockito.mock(Connection.class);
        Statement statement = org.mockito.Mockito.mock(Statement.class);
        ResultSet resultSet = org.mockito.Mockito.mock(ResultSet.class);

        when(dataSource.getConnection()).thenReturn(connection);
        when(connection.createStatement()).thenReturn(statement);
        when(statement.executeQuery("SELECT tick FROM ticks")).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true, false);
        when(resultSet.getTimestamp("tick")).thenReturn(Timestamp.from(Instant.parse("2024-01-01T00:00:00Z")));

        mockMvc.perform(get("/database"))
                .andExpect(status().isOk())
                .andExpect(view().name("database"))
                .andExpect(model().attributeExists("records"));
    }

    @Test
    void databaseReturnsErrorOnFailure() throws Exception {
        when(dataSource.getConnection()).thenThrow(new RuntimeException("Connection refused"));

        mockMvc.perform(get("/database"))
                .andExpect(view().name("error"))
                .andExpect(model().attribute("message", "Connection refused"));
    }
}
