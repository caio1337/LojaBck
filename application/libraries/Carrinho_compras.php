<?php  

defined('BASEPATH') OR exit('Ação não permitida');

class Carrinho_compras{

    public function __construct() {

        //Verifica se existe uma chave chamada carrinho
        if(!isset($_SESSION['carrinho'])){

            $_SESSION['carrinho'] = [];
        }
        
    }

    public function insert($produto_id = NULL, $produto_quantidade = NULL){

        if($produto_id && $produto_quantidade){
            
            if(isset($_SESSION['carrinho'][$produto_id])){
                $_SESSION['carrinho'][$produto_id] += $produto_quantidade;
            }else{
                $_SESSION['carrinho'][$produto_id] = $produto_quantidade;
            }
        }

    }

    //Atualiza a quantidade de itens do produto no carrinho
    public function update($produto_id = NULL, $produto_quantidade = NULL){

        if($produto_id && $produto_quantidade && $produto_quantidade > 0){
            $_SESSION['carrinho'][$produto_id] = $produto_quantidade;
        }
    }

    //Remove o produto do carrinho
    public function delete($produto_id = NULL){

        unset($_SESSION['carrinho'][$produto_id]);
    }

    //Limpa todo o carrinho de compras
    public function clean(){
        
        unset($_SESSION['carrinho']);
    }

    //Lista produtos no carrinho
    public function get_all(){

        $CI = & get_instance();
        $CI->load->model('carrinho_model'); //Criar 

        $retorno = array();
        $indice = 0;

        foreach($_SESSION['carrinho'] as $produto_id => $produto_quantidade){

            $query = $CI->carrinho_model->get_by_id($produto_id);

            $retorno[$indice]['produto_id'] = $query->produto_id;
            $retorno[$indice]['produto_nome'] = $query->produto_nome;
            $retorno[$indice]['produto_valor'] = $query->produto_valor;
            $retorno[$indice]['produto_quantidade'] = $produto_quantidade;
            $retorno[$indice]['subtotal'] = number_format($produto_quantidade * $query->produto_valor, 2, '.', '');
            $retorno[$indice]['produto_peso'] = $query->produto_peso;
            $retorno[$indice]['produto_altura'] = $query->produto_altura;
            $retorno[$indice]['produto_largura'] = $query->produto_largura;
            $retorno[$indice]['produto_comprimento'] = $query->produto_comprimento;
            $retorno[$indice]['produto_foto'] = $query->foto_caminho;
            $retorno[$indice]['produto_meta_link'] = $query->produto_meta_link;

            //Incrementa a variavel indice
            $indice++;


        }

        return $retorno;
   
   
    }

    //Exibe o valor total do carrinho
    public function get_total(){

        $carrinho = $this->get_all();
        $valor_total_carrinho = 0;

        foreach($carrinho as $indice => $produto){
            $valor_total_carrinho += $produto['subtotal'];
        }

        return number_format($valor_total_carrinho, 2);
    }

    //Exibe o total de itens no carrinho
    public function get_total_itens(){

        $total_itens = count($this->get_all());

        return $total_itens;
    }

    //Recupera as dimensoes dos produtos do carrinho
    public function get_all_dimensoes(){

        $CI = & get_instance();
        $CI->load->model('carrinho_model'); //Criar 

        
        $retorno = array();
        $indice = 0;

        foreach($_SESSION['carrinho'] as $produto_id => $produto_quantidade){

            $query = $CI->carrinho_model->get_by_id($produto_id);

            $retorno[$indice]['produto_nome'] = $query->produto_nome;
            $retorno[$indice]['produto_peso'] = $query->produto_peso;
            $retorno[$indice]['produto_altura'] = $query->produto_altura;
            $retorno[$indice]['produto_largura'] = $query->produto_largura;
            $retorno[$indice]['produto_comprimento'] = $query->produto_comprimento;
            $retorno[$indice]['produto_dimensao'] = $query->produto_altura + $query->produto_largura + $query->produto_comprimento;


            //Incrementa a variavel indice
            $indice++;


        }

        return $retorno;

    }

    //Recupera o produto de maior dimensao 
    public function get_produto_maior_dimensao(){

        $produtos = $this->get_all_dimensoes();
        $maior_produto = NULL;
        $item = array();

        foreach($produtos as $indice => $produto){

            if($maior_produto == NULL){
                
                $maior_produto = $produto['produto_dimensao'];
                $item = $produto; //Armazenando na variavel item os atributos do objeto $produto
            }else{

                //Compara qual produto tem maior dimensao
                if($produto['produto_dimensao'] > $maior_produto){
                    
                    $maior_produto = $produto['produto_dimensao'];
                    $item = $produto;
                }
            }
        }

        return $item; // Retorna o produto de maior dimensao
    }

    //Recupera o peso total do carrinho
    public function get_total_pesos(){

        $carrinho = $this->get_all();
        $total_pesos = 0;

        foreach($carrinho as $indice => $produto){

            $total_pesos += $produto['produto_peso'] * $produto['produto_quantidade'];
        }

        return $total_pesos;
    }



}