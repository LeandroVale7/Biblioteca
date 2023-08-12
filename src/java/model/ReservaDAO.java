package model;

import java.sql.*;
import java.util.ArrayList;

public class ReservaDAO extends DataBaseDAO {

    public void cadastrar(Reserva re) throws Exception {

        String sql = "INSERT INTO reserva(idExemplar, idUsuario) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, re.getExemplar().getIdExemplar());
        pstm.setInt(2, re.getUsuario().getIdUsuario());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Reserva> listar() throws Exception {
        ArrayList<Reserva> lista = new ArrayList<>();
        String sql = "SELECT * FROM reserva";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Reserva re = new Reserva();

            re.setIdReserva(rs.getInt("idReserva"));

            //instancia das classe associativas
            ExemplarDAO exDAO = new ExemplarDAO();
            UsuarioDAO uDAO = new UsuarioDAO();

            re.setExemplar(exDAO.carregaPorIdExemplar(rs.getInt("idExemplar")));
            re.setUsuario(uDAO.carregaPorIdUsuario(rs.getInt("idUsuario")));

            lista.add(re);
        }
        this.desconectar();
        return lista;
    }

    public Reserva carregaPorIdReserva(int idReserva) throws Exception {
        Reserva re = new Reserva();
        String sql = "SELECT * FROM reserva WHERE idReserva=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idReserva);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            re.setIdReserva(rs.getInt("idReserva"));

            //instancia das classe associativas
            ExemplarDAO exDAO = new ExemplarDAO();
            UsuarioDAO uDAO = new UsuarioDAO();

            re.setExemplar(exDAO.carregaPorIdExemplar(rs.getInt("idExemplar")));
            re.setUsuario(uDAO.carregaPorIdUsuario(rs.getInt("idUsuario")));

        }

        this.desconectar();
        return re;
    }

    public void alterar(Reserva re) throws Exception {
        String sql = "UPDATE reserva SET idExemplar=?, idUsuario=? WHERE idReserva=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, re.getExemplar().getIdExemplar());
        pstm.setInt(2, re.getUsuario().getIdUsuario());
        pstm.setInt(3, re.getIdReserva());
        pstm.executeUpdate();
        this.desconectar();
    }

    public void excluir(int idReserva) throws Exception {
        String sql = "DELETE FROM reserva WHERE idReserva=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idReserva);
        pstm.execute();
        this.desconectar();
    }
}
