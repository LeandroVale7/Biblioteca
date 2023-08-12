package model;

public class Exemplar {

    private int idExemplar;
    private Livro livro;//chave estrangeira
    private String quantExemplar, conservacao;
    private int status;

    public int getIdExemplar() {
        return idExemplar;
    }

    public void setIdExemplar(int idExemplar) {
        this.idExemplar = idExemplar;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    public String getQuantExemplar() {
        return quantExemplar;
    }

    public void setQuantExemplar(String quantExemplar) {
        this.quantExemplar = quantExemplar;
    }

    public String getConservacao() {
        return conservacao;
    }

    public void setConservacao(String conservacao) {
        this.conservacao = conservacao;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
