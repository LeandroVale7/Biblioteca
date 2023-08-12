package model;

import java.sql.*;
import java.util.ArrayList;

public class EditoraDAO extends DataBaseDAO{
    public void cadastrar(Editora ed) throws Exception{
        String sql = "INSERT INTO Editora (nome, endereco)"+" VALUES (?,?,?)";
        
        this.conectar();//valida a conexão com o bd
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ed.getNome());
        pstm.setString(2, ed.getEndereco());
        pstm.execute();
        
        this.desconectar();
    }
    
    public ArrayList<Editora> listar() throws Exception{
        ArrayList<Editora> lista = new ArrayList<>();
        String sql = "SELECT * FROM editora";
        this.conectar();
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        
        while(rs.next()){
            Editora ed = new Editora();
            ed.setCnpj(rs.getInt("cnpj"));
            ed.setNome(rs.getString("nome"));
            ed.setEndereco(rs.getString("endereco"));
            lista.add(ed);
        }
        this.desconectar();
        return lista;
    }
    
    public void alterar(Editora ed)throws Exception{
        String sql = "UPDATE editora SET nome=?, endereco=? WHERE cnpj=?";
        this.conectar();
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ed.getNome());
        pstm.setString(2, ed.getEndereco());
        
        pstm.execute();
        this.desconectar();
        
    }
    
    public void excluir(int cnpj) throws Exception{
        Editora ed = new Editora();
        String sql = "DELETE FROM editora WHERE cnpj=?";
        this.conectar();
        PreparedStatement pstm =conn.prepareStatement(sql);
        pstm.setInt(1, cnpj);
        pstm.execute();
        
        this.desconectar();
    }
    
}
