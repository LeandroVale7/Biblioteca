package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseDAO {
    
    Connection conn; //ainda não iniciada

    public void conectar() throws Exception {//cria uma conexão 
        //qualquer erro que aconteca dentro do método conectar será tratado posteriormente 
        Class.forName("com.mysql.jdbc.Driver");//carrega o driver do MySQL
        String user = "root";
        String senha = "";
        String url = "jdbc:mysql://127.0.0.1/biblioteca";
        conn = DriverManager.getConnection(url, user, senha);//atribui à variavel conn, estabelece a conexao
    }

    public void desconectar() throws Exception {//verifica se a conexao não foi encerrada para depois encerrar
        if (!conn.isClosed()) {
            conn.close();

        }
    }
}
