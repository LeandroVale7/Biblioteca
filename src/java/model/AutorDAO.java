
package model;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Ana Caroline
 */
public class AutorDAO extends DataBaseDAO{
    public void cadastrar(Autor au) throws Exception{
        String sql = "INSERT INTO autor (nome, sobrenome, biografia) VALUES (?,?,?)";
        
        this.conectar();//valida a conexão com o bd
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, au.getNome());
        pstm.setString(2, au.getSobrenome());
        pstm.setString(3, au.getBiografia());
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Autor> listar() throws Exception{
        ArrayList<Autor> lista = new ArrayList<>();
        String sql = "SELECT * FROM autor";
        this.conectar();
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Autor au = new Autor();
            au.setIdAutor(rs.getInt("idAutor"));
            au.setNome(rs.getString("nome"));
            au.setSobrenome(rs.getString("sobrenome"));
            au.setBiografia(rs.getString("biografia"));
            
            lista.add(au);
        }
        this.desconectar();
        return lista;
    }
    
    public Autor carregaPorIdAutor(int idAutor) throws Exception {
        Autor a = new Autor();
        String sql = "SELECT * FROM autor WHERE idAutor=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idAutor);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            a.setIdAutor(rs.getInt("idAutor"));
            a.setNome(rs.getString("nome"));
            a.setSobrenome(rs.getString("sobrenome"));
            a.setBiografia(rs.getString("biografia"));
        }
        this.desconectar();
        return a;
    }
    
    public void alterar(Autor au)throws Exception{
        String sql = "UPDATE autor SET nome=?, sobrenome=?, biografia=? WHERE idAutor=?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, au.getNome());
        stmt.setString(2, au.getSobrenome());
        stmt.setString(3, au.getBiografia());
        stmt.setInt(4, au.getIdAutor());
        
        stmt.executeUpdate();
        this.desconectar();
        
    }
    
    public void excluir(int idAutor) throws Exception{
        String sql = "DELETE FROM autor WHERE idAutor=?";
        this.conectar();
        PreparedStatement stmt =conn.prepareStatement(sql);
        stmt.setInt(1, idAutor);
        stmt.execute();
        this.desconectar();
    }
}
