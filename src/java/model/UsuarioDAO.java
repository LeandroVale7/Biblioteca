package model;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    // classe de persistencia de dados, essa classe tem as ações de banco relativas ao usuario 
    //extensão da classe databasedao 
    public void cadastrar(Usuario u) throws Exception {
        String sql = "INSERT INTO usuario (nome, login, senha, email, cpf, idPerfil)VALUES (?,?,?,?,?,?)";
        this.conectar();//atribui ao atributo conn, uma conexão válida
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getLogin());
        pstm.setString(3, u.getSenha());
        pstm.setString(4, u.getEmail());
        pstm.setString(5, u.getCpf());//stmt.setString(2, Integer.toString(u.getCpf()));
        pstm.setInt(6, u.getPerfil().getIdPerfil());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> lista = new ArrayList<>();
        String sql = "SELECT u.idUsuario, u.nome, u.login, u.email, u.cpf, u.senha, u.status, u.idPerfil FROM usuario u"; //Compara as tabelas,
        //nesse caso chave primaria e estrangeira

        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Usuario u = new Usuario();

            u.setIdUsuario(rs.getInt("idUsuario"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setEmail(rs.getString("email"));
            u.setCpf(rs.getString("cpf"));
            u.setStatus(rs.getInt("status"));

            //instancia da classe perfil
            PerfilDAO pDAO = new PerfilDAO();
            //associação entre usuario e o perfil
            u.setPerfil(pDAO.carregaPorIdPerfil(rs.getInt("idPerfil")));
            lista.add(u);
        }
        this.desconectar();
        return lista;
    }

    public Usuario carregaPorIdUsuario(int idUsuario) throws Exception {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE idUsuario=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idUsuario);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            u.setIdUsuario(rs.getInt("idUsuario"));
            u.setNome(rs.getString("nome"));
            u.setLogin(rs.getString("login"));
            u.setSenha(rs.getString("senha"));
            u.setEmail(rs.getString("email"));
            u.setCpf(rs.getString("cpf"));
            u.setStatus(rs.getInt("status"));

            //instancia da classe perfil
            PerfilDAO pDAO = new PerfilDAO();
            //associação entre usuario e o perfil
            u.setPerfil(pDAO.carregaPorIdPerfil(rs.getInt("idPerfil")));
        }
        this.desconectar();
        return u;
    }

    public void alterar(Usuario u) throws Exception {
        String sql = "UPDATE usuario SET nome=?, login=?, senha=?, email=?, cpf=?, idPerfil=? WHERE idUsuario=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, u.getNome());
        pstm.setString(2, u.getLogin());
        pstm.setString(3, u.getSenha());
        pstm.setString(4, u.getEmail());
        pstm.setString(5, u.getCpf());
        pstm.setInt(6, u.getPerfil().getIdPerfil());
        pstm.setInt(7, u.getIdUsuario());
        pstm.executeUpdate();
        this.desconectar();
    }

    public boolean desativar(Usuario u) throws Exception {
        String sql = "UPDATE usuario set status = 0 WHERE idUsuario = ?";

        this.conectar();//atribui ao atributo conn, uma conexão válida
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, u.getIdUsuario());
        pstm.executeUpdate();
        this.desconectar();
        return true;
    }

    public boolean ativar(Usuario u) throws Exception {

        String sql = "UPDATE usuario set status = 1 WHERE idUsuario = ?";

        this.conectar();//atribui ao atributo conn, uma conexão válida
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, u.getIdUsuario());
        pstm.executeUpdate();
        this.desconectar();
        return true;
    }

    public Usuario logar(String login, String senha) throws Exception {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM usuario WHERE status=1 AND login=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setSenha(rs.getString("senha"));
                u.setEmail(rs.getString("email"));
                u.setCpf(rs.getString("cpf"));
                u.setStatus(rs.getInt("status"));

                //instancia da classe perfil
                PerfilDAO pDAO = new PerfilDAO();
                //associação entre usuario e o perfil
                u.setPerfil(pDAO.carregaPorIdPerfil(rs.getInt("idPerfil")));
            }
        }
        this.desconectar();
        return u;
    }
}
