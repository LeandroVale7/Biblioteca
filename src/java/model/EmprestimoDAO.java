package model;

import java.sql.*;
import java.util.ArrayList;

public class EmprestimoDAO extends DataBaseDAO {

    public void cadastrar(Emprestimo em) throws Exception {

        String sql = "INSERT INTO emprestimo(dataEmprestimo, dataDevolucao, idExemplar, idUsuario) VALUES(?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, new Date(em.getDataEmprestimo().getTime()));
        pstm.setDate(2, new Date(em.getDataDevolucao().getTime()));
        pstm.setInt(3, em.getExemplar().getIdExemplar());
        pstm.setInt(4, em.getUsuario().getIdUsuario());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Emprestimo> listar() throws Exception {
        ArrayList<Emprestimo> lista = new ArrayList<>();
        String sql = "SELECT * FROM emprestimo";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Emprestimo em = new Emprestimo();

            em.setIdEmprestimo(rs.getInt("idEmprestimo"));
            em.setDataEmprestimo(rs.getDate("dataEmprestimo"));
            em.setDataDevolucao(rs.getDate("dataDevolucao"));

            //instancia das classe associativas
            ExemplarDAO exDAO = new ExemplarDAO();
            UsuarioDAO uDAO = new UsuarioDAO();

            em.setExemplar(exDAO.carregaPorIdExemplar(rs.getInt("idExemplar")));
            em.setUsuario(uDAO.carregaPorIdUsuario(rs.getInt("idUsuario")));

            lista.add(em);
        }
        this.desconectar();
        return lista;
    }

    public Emprestimo carregaPorIdEmprestimo(int idEmprestimo) throws Exception {
        Emprestimo em = new Emprestimo();
        String sql = "SELECT * FROM emprestimo WHERE idEmprestimo=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEmprestimo);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            em.setIdEmprestimo(rs.getInt("idEmprestimo"));
            em.setDataEmprestimo(rs.getDate("dataEmprestimo"));
            em.setDataDevolucao(rs.getDate("dataDevolucao"));

            //instancia das classe associativas
            ExemplarDAO exDAO = new ExemplarDAO();
            UsuarioDAO uDAO = new UsuarioDAO();

            em.setExemplar(exDAO.carregaPorIdExemplar(rs.getInt("idExemplar")));
            em.setUsuario(uDAO.carregaPorIdUsuario(rs.getInt("idUsuario")));

        }

        this.desconectar();
        return em;
    }

    public void alterar(Emprestimo em) throws Exception {
        String sql = "UPDATE emprestimo SET dataEmprestimo=?, dataDevolucao=?, idExemplar=?, idUsuario=? WHERE idEmprestimo=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDate(1, new Date(em.getDataEmprestimo().getTime()));
        pstm.setDate(2, new Date(em.getDataDevolucao().getTime()));
        pstm.setInt(3, em.getExemplar().getIdExemplar());
        pstm.setInt(4, em.getUsuario().getIdUsuario());
        pstm.setInt(5, em.getIdEmprestimo());
        pstm.executeUpdate();
        this.desconectar();
    }

    public void excluir(int idEmprestimo) throws Exception {
        String sql = "DELETE FROM emprestimo WHERE idEmprestimo=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idEmprestimo);
        pstm.execute();
        this.desconectar();
    }
}
