import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by Martin on 14.08.2015.
 */
public class Server {
    int port = 1325;

    public static void main(String[]args){

    }
    private void startServer(){
        try {
            ServerSocket socket = new ServerSocket(port);
            while(true) {
                Socket client = socket.accept();
                if (client.isConnected())
                    System.out.println("got a connection");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

