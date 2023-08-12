
package model;

import java.sql.*;
import java.util.ArrayList;


public class LivroDAO extends DataBaseDAO{
     //Métodos que representam o CRUD
    public void cadastrar(Livro li) throws Exception {
        String sql = "INSERT INTO livro (titulo, genero, local, ano,"
                + "descFisica, idioma, assunto, curso, cutter, tombamento, editora, isbn) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, li.getTitulo());
        pstm.setString(2, li.getGenero());
        pstm.setString(3, li.getLocal());
        pstm.setDate(4, new Date(li.getAno().getTime()));
        pstm.setString(5, li.getDescFisica());
        pstm.setString(6, li.getIdioma());
        pstm.setString(7, li.getAssunto());
        pstm.setString(8, li.getCurso());
        pstm.setString(9, li.getCutter());
        pstm.setString(10, li.getTombamento());
        pstm.setString(11, li.getEditora());
        pstm.setString(12, li.getIsbn());

        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Livro> listar() throws Exception {
        ArrayList<Livro> lista = new ArrayList<>();
        String sql = " SELECT * FROM livro";
        this.conectar();

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Livro li = new Livro();

            li.setIdLivro(rs.getInt("idLivro"));
            li.setTitulo(rs.getString("titulo"));
            li.setGenero(rs.getString("genero"));
            li.setLocal(rs.getString("local"));
            li.setPais(rs.getString("pais"));
            li.setAno(rs.getDate("ano"));
            li.setDescFisica(rs.getString("descFisica"));
            li.setIdioma(rs.getString("idioma"));
            li.setAssunto(rs.getString("assunto"));
            li.setCurso(rs.getString("curso"));
            li.setCutter(rs.getString("cutter"));
            li.setTombamento(rs.getString("tombamento"));
            li.setEditora(rs.getString("editora"));
            li.setIsbn(rs.getString("isbn"));
            lista.add(li);
        }

        this.desconectar();
        return lista;

    }

    public Livro carregaPorIdLivro(int idLivro) throws Exception {
        Livro li = new Livro();
        String sql = "SELECT * FROM livro WHERE idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLivro);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            li.setIdLivro(rs.getInt("idLivro"));
            li.setTitulo(rs.getString("titulo"));
            li.setGenero(rs.getString("genero"));
            li.setLocal(rs.getString("local"));
            li.setPais(rs.getString("pais"));
            li.setAno(rs.getDate("ano"));
            li.setDescFisica(rs.getString("descFisica"));
            li.setIdioma(rs.getString("idioma"));
            li.setAssunto(rs.getString("assunto"));
            li.setCurso(rs.getString("curso"));
            li.setCutter(rs.getString("cutter"));
            li.setTombamento(rs.getString("tombamento"));
            li.setEditora(rs.getString("editora"));
            li.setIsbn(rs.getString("isbn"));
            li.setAutores(this.carregarLivroAutor(idLivro));

        }
        this.desconectar();
        return li;
    }

    public void alterar(Livro li) throws Exception {
        String sql = "UPDATE livro SET titulo=?, genero=?, local=?, "
                + "pais=?,ano=?, descFisica=?, idioma=?, assunto=?, curso=?, cutter=?, tombamento=?, editora=?, isbn=? "
                + "WHERE idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, li.getTitulo());
        pstm.setString(2, li.getGenero());
        pstm.setString(3, li.getLocal());
        pstm.setString(4, li.getPais());
        pstm.setDate(5, new Date(li.getAno().getTime()));
        pstm.setString(6, li.getDescFisica());
        pstm.setString(7, li.getIdioma());
        pstm.setString(8, li.getAssunto());
        pstm.setString(9, li.getCurso());
        pstm.setString(10, li.getCutter());
        pstm.setString(11, li.getTombamento());
        pstm.setString(12, li.getEditora());
        pstm.setString(13, li.getIsbn());
        pstm.setInt(14, li.getIdLivro());
        pstm.executeUpdate();
        this.desconectar();
    }

    public void excluir(int idLivro) throws Exception {
        String sql = "DELETE FROM livro WHERE idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLivro);
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Autor> carregarLivroAutor(int idLivro) throws Exception {
        ArrayList<Autor> lista = new ArrayList<>();
        String sql = "SELECT a.* FROM autor as a, livro_autor as la WHERE a.idAutor=la.idAutor AND la.idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLivro);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Autor a = new Autor();
            a.setIdAutor(rs.getInt("idAutor"));
            a.setNome(rs.getString("nome"));
            a.setSobrenome(rs.getString("sobrenome"));
            a.setBiografia(rs.getString("biografia"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Autor> carregarAutorNaoLivro(int idLivro) throws Exception {
        ArrayList<Autor> lista = new ArrayList<>();
        String sql = "SELECT a.* FROM autor as a WHERE a.idAutor NOT IN(SELECT idAutor FROM livro_autor WHERE idLivro=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idLivro);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Autor a = new Autor();
            a.setIdAutor(rs.getInt("idAutor"));
            a.setNome(rs.getString("nome"));
            a.setSobrenome(rs.getString("sobrenome"));
            a.setBiografia(rs.getString("biografia"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }
    
    public void vincularAutor(int idAutor,int idLivro) throws Exception {
        String sql = "INSERT INTO livro_autor (idAutor, idLivro) VALUES(?, ?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idAutor);
        pstm.setInt(2, idLivro);
        pstm.execute();
        this.desconectar();
    }
    
    public void desvincularAutor(int idAutor,int idLivro) throws Exception {
        String sql = "DELETE FROM livro_autor WHERE idAutor=? AND idLivro=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idAutor);
        pstm.setInt(2, idLivro);
        pstm.execute();
        this.desconectar();
    }
}