package model;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Leandro
 */
public class PerfilDAO extends DataBaseDAO {

    public void cadastrar(Perfil p) throws Exception {
        String sql = "INSERT INTO perfil (nome, dataCadastro) VALUES(?, ?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setDate(2, new Date(p.getDataCadastro().getTime()));
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<>();
        String sql = "SELECT * FROM perfil";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
            p.setDataCadastro(rs.getDate("dataCadastro"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }

    public Perfil carregaPorIdPerfil(int idPerfil) throws Exception {
        Perfil p = new Perfil();
        String sql = "SELECT * FROM perfil WHERE idPerfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idPerfil);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setIdPerfil(rs.getInt("idPerfil"));
            p.setNome(rs.getString("nome"));
            p.setDataCadastro(rs.getDate("dataCadastro"));
            p.setMenus(this.carregarMenusPerfil(idPerfil));
        }
        this.desconectar();
        return p;
    }

    public void alterar(Perfil p) throws Exception {
        String sql = "UPDATE perfil SET nome=?, dataCadastro=? WHERE idPerfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setDate(2, new Date(p.getDataCadastro().getTime()));
        pstm.setInt(3, p.getIdPerfil());
        pstm.executeUpdate();
        this.desconectar();
    }

    public  void  excluir ( int  idPerfil ) throws Exception{
       String sql = "DELETE FROM perfil WHERE idPerfil=?";
       this.conectar();
       PreparedStatement pstm = conn.prepareStatement(sql);
       pstm.setInt(1, idPerfil);
       pstm.execute();
       this.desconectar();
    }
    
    public ArrayList<Menu> carregarMenusPerfil(int idPerfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<>();
        String sql = "SELECT m.* FROM menu as m, menu_perfil as pm WHERE m.idMenu=pm.idMenu AND pm.idPerfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idPerfil);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Menu> carregarMenusNaoPerfil(int idPerfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<>();
        String sql = "SELECT m.* FROM menu as m WHERE m.idMenu NOT IN(SELECT idMenu FROM menu_perfil WHERE idPerfil=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idPerfil);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setIdMenu(rs.getInt("idMenu"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
    public void vincularMenu(int idMenu,int idPerfil) throws Exception {
        String sql = "INSERT INTO menu_perfil (idMenu, idPerfil) VALUES(?, ?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idMenu);
        pstm.setInt(2, idPerfil);
        pstm.execute();
        this.desconectar();
    }
    
    public void desvincularMenu(int idMenu, int idPerfil) throws Exception {
        String sql = "DELETE FROM menu_perfil WHERE idMenu=? AND idPerfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idMenu);
        pstm.setInt(2, idPerfil);
        pstm.execute();
        this.desconectar();
    }
}
