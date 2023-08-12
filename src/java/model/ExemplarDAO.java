package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExemplarDAO extends DataBaseDAO {

    public void cadastrar(Exemplar ex) throws Exception {

        String sql = "INSERT INTO exemplar(quantExemplar, conservacao, idLivro) VALUES(?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ex.getQuantExemplar());
        pstm.setString(2, ex.getConservacao());
        pstm.setInt(3, ex.getLivro().getIdLivro());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Exemplar> listar() throws Exception {
        ArrayList<Exemplar> lista = new ArrayList<>();
        String sql = "SELECT ex.idExemplar, ex.quantExemplar, ex.conservacao, ex.status, ex.idLivro FROM exemplar ex";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Exemplar ex = new Exemplar();

            ex.setIdExemplar(rs.getInt("idExemplar"));
            ex.setQuantExemplar(rs.getString("quantExemplar"));
            ex.setConservacao(rs.getString("conservacao"));
            ex.setStatus(rs.getInt("status"));

            LivroDAO liDAO = new LivroDAO();
            ex.setLivro(liDAO.carregaPorIdLivro(rs.getInt("idLivro")));
            lista.add(ex);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Exemplar> listarExemplarAtivo() throws Exception {
        ArrayList<Exemplar> lista = new ArrayList<>();
        String sql = "SELECT * FROM exemplar WHERE status=1";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Exemplar ex = new Exemplar();

            ex.setIdExemplar(rs.getInt("idExemplar"));
            ex.setQuantExemplar(rs.getString("quantExemplar"));
            ex.setConservacao(rs.getString("conservacao"));
            ex.setStatus(rs.getInt("status"));

            LivroDAO liDAO = new LivroDAO();
            ex.setLivro(liDAO.carregaPorIdLivro(rs.getInt("idLivro")));
            lista.add(ex);
        }
        this.desconectar();
        return lista;
    }

    public Exemplar carregaPorIdExemplar(int idExemplar) throws Exception {
        Exemplar ex = new Exemplar();
        String sql = "SELECT * FROM exemplar WHERE idExemplar=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idExemplar);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            ex.setIdExemplar(rs.getInt("idExemplar"));
            ex.setQuantExemplar(rs.getString("quantExemplar"));
            ex.setConservacao(rs.getString("conservacao"));
            ex.setStatus(rs.getInt("status"));

            LivroDAO liDAO = new LivroDAO();
            ex.setLivro(liDAO.carregaPorIdLivro(rs.getInt("idLivro")));
        }

        this.desconectar();
        return ex;
    }

    public void alterar(Exemplar ex) throws Exception {
        String sql = "UPDATE exemplar SET quantExemplar=?, conservacao=?, idLivro=? WHERE idExemplar=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, ex.getQuantExemplar());
        pstm.setString(2, ex.getConservacao());
        pstm.setInt(3, ex.getLivro().getIdLivro());
        pstm.setInt(4, ex.getIdExemplar());
        pstm.executeUpdate();
        this.desconectar();
    }

    public boolean desativar(Exemplar ex) throws Exception {
        String sql = "UPDATE exemplar set status = 0 WHERE idExemplar = ?";

        this.conectar();//atribui ao atributo conn, uma conexão válida
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ex.getIdExemplar());
        pstm.executeUpdate();
        this.desconectar();
        return true;
    }

    public boolean ativar(Exemplar ex) throws Exception {

        String sql = "UPDATE exemplar set status = 1 WHERE idExemplar = ?";

        this.conectar();//atribui ao atributo conn, uma conexão válida
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ex.getIdExemplar());
        pstm.executeUpdate();
        this.desconectar();
        return true;
    }

    public void excluir(int idExemplar) throws Exception {
        String sql = "DELETE FROM exemplar WHERE idExemplar=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idExemplar);
        pstm.execute();
        this.desconectar();
    }

}
