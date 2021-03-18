var App_checkout = function () {



    /*    var del_item_carrinho = function () {
    
    
            $('.btn-del-item').on('click', function () {
    
    
                var produto_id = $(this).attr('data-id');
    
                $.ajax({
    
                    type: 'post',
                    url: BASE_URL + 'carrinho/delete',
                    dataType: 'json',
                    data: {
                        produto_id: produto_id,
                    },
                }).then(function (response) {
    
    
                    if (response.erro === 0) {
    
                        $(this).parent().parent().remove(); //Remove a linha
                        window.location.href = BASE_URL + 'carrinho';
    
                    } else {
    
                        alert('Não foi possível excluir o produto. Contacte o suporte');
    
                    }
    
    
                    console.log(response);
    
                });
    
    
    
    
    
    
    
            });
    
    
    
        }
    
        var altera_quantidade_carrinho = function () {
    
    
            $('.btn-altera-quantidade').on('click', function () {
    
                var produto_id = $(this).attr('data-id');
                var produto_quantidade = $("#produto_" + produto_id).val();
    
                //alert(produto_id + '--' + produto_quantidade);
                if (produto_quantidade == "" || produto_quantidade < 1) {
    
                    $('#mensagem').html('<div class="alert alert-danger alert-dismissible fade show mt-2" role="alert"> Informe a quantidade maior que zero <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
    
                } else {
    
                    $.ajax({
    
                        type: 'post',
                        url: BASE_URL + 'carrinho/update',
                        dataType: 'json',
                        data: {
                            produto_id: produto_id,
                            produto_quantidade: produto_quantidade,
                        },
                    }).then(function (response) {
    
                        if (response.erro === 0) {
    
                            window.location.href = BASE_URL + 'carrinho';
    
                        } else {
    
                            $('#mensagem').html('<div class="alert alert-success alert-dismissible fade show mt-2" role="alert">' + response.mensagem + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
    
                        }
    
    
                        console.log(response);
    
                    });
    
                }
    
    
    
    
    
    
    
            });
    
    
    
        }
    
        var limpa_carrinho = function () {
    
    
            $('.btn-limpa-carrinho').on('click', function () {
    
                $.ajax({
    
                    type: 'post',
                    url: BASE_URL + 'carrinho/clean',
                    dataType: 'json',
                    data: {
                        clean: true,
                    },
                }).then(function (response) {
    
                    if (response.erro === 0) {
    
                        window.location.href = BASE_URL + 'carrinho';
    
                    } else {
    
                        alert('Houve um erro ao limpar o carrinho. Contacte o suporte');
    
                    }
    
    
                    console.log(response);
    
                });
    
            });
    
        }
    
        var calcula_frete = function () {
    
            $('#btn-calcula-frete-carrinho').on('click', function () {
    
    
                var cep = $("#cep").val();
    
                $.ajax({
    
                    type: 'post',
                    url: BASE_URL + 'carrinho/calcula_frete',
                    dataType: 'json',
                    data: {
                        cep: cep,
                    },
                    beforeSend: function () {
                        $('#btn-calcula-frete-carrinho').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Calculando...</span>');
                    },
                }).then(function (response) {
    
    
                    if (response.erro === 0) {
    
                        //Sucesso
                        $('#btn-calcula-frete-carrinho').html('Calcular frete');
                        $('#retorno-frete').html(response.retorno_endereco);
    
                        get_opcao_frete_carrinho(); //chama a função no response para criar o name do frete carrinho.
    
    
                    } else {
    
                        //Erro de formatação ou validação
    
                        $('#retorno-frete').html(response.retorno_endereco);
    
    
                    }
    
    
                    console.log(response);
    
                });
    
    
    
    
            });
    
        }
    
        var get_opcao_frete_carrinho = function () {
    
    
            $('[name="opcao_frete_carrinho"]').on('click', function () {
    
                var opcao_frete_escolhido = $(this).attr('data-valor_frete');
                var total_final_carrinho = $(this).attr('data-valor_final_carrinho');
    
    
                $('#opcao_frete_escolhido').html('R$&nbsp;' + opcao_frete_escolhido);
                $('#total_final_carrinho').html('R$&nbsp;' + total_final_carrinho);
    
    
            });
    
        }
    
    
    
    */

   var set_session_payment = function () {


    $.ajax({

        url: BASE_URL + 'pagar/pag_seguro_session_id',
        dataType: 'json',
        success: function (response) {

            if (response.erro === 0) {

                var session_id = response.session_id;
                if (session_id) {

                    PagSeguroDirectPayment.setSessionId(session_id);
                }else {

                    window.location.href = BASE_URL + 'checkout';
                }


            } else {

                console.log(response.mensagem);
            }

        },
        error: function (error) {

            alert('Não foi possível integrar com o pagseguro');
        }

    });
}


   var get_opcao_frete_carrinho = function () {


    $('[name="opcao_frete_carrinho"]').on('click', function () {

        var opcao_frete_escolhido = $(this).attr('data-valor_frete');
        var total_final_carrinho = $(this).attr('data-valor_final_carrinho');
        $('#opcao_frete_escolhido').html('R$&nbsp;' + opcao_frete_escolhido);
        $('#total_final_carrinho').html('R$&nbsp;' + total_final_carrinho);
    });
}

    var calcula_frete = function () {

        $('#btn-busca-cep').on('click', function () {


            var cliente_cep = $("#cliente_cep").val();
            $.ajax({

                type: 'post',
                url: BASE_URL + 'checkout/calcula_frete',
                dataType: 'json',
                data: {
                    cliente_cep: cliente_cep,
                },
                beforeSend: function () {
                     $('#erro_frete').html('');
                     $('.endereco').addClass('d-none');
                    $('#btn-busca-cep').html('<span class="text-white"><i class="fa fa-cog fa-spin"></i>&nbsp;Calculando...</span>');
                },
            }).then(function (response) {


                if (response.erro === 0) {

                    //Sucesso

                    //Exibe os campos escondidos
                    $('.endereco').removeClass('d-none');
                    $('#btn-busca-cep').html('Calcular');
                    $('#retorno-frete').html(response.retorno_endereco);
                    //Preenchendo os inputs com os valores adequados
                    $('[name="cliente_endereco"]').val(response.endereco);
                    $('[name="cliente_bairro"]').val(response.bairro);
                    $('[name="cliente_cidade"]').val(response.cidade);
                    get_opcao_frete_carrinho(); // Chamo a função aqui no response para criar o name opcao_frete_carrinho;

                } else {

                    //Erro de formatação ou validação

                    $('#btn-busca-cep').html('Calcular');
                    $('#erro_frete').html(response.retorno_endereco);
                    
                }


                console.log(response);
            });
        });
    }

    var forma_pagamento = function () {

        $('.forma_pagamento').on('change', function () {

            var opcao = $(this).val();

            switch (opcao) {
                case '1':
                    $('.cartao').removeClass('d-none');
                    $('.opcao-debito-conta').addClass('d-none');
                    $('.opcao-boleto').addClass('d-none');
                    $('.cartao input').prop('disabled', false);
                    $('.opcao-debito-conta select').prop('disabled', true);
                    break;

                case '2':
                    $('.cartao').addClass('d-none');
                    $('.opcao-boleto').removeClass('d-none');
                    $('.opcao-debito-conta').addClass('d-none');
                    $('.cartao input').prop('disabled', true);
                    $('.opcao-debito-conta select').prop('disabled', true);
                    break;

                case '3':
                    $('.cartao').addClass('d-none');
                    $('.opcao-debito-conta').removeClass('d-none');
                    $('.opcao-boleto').addClass('d-none');
                    $('.cartao input').prop('disabled', true);
                    $('.opcao-debito-conta select').prop('disabled', false);
                    break;


            }
        })

    }


    return {

        init: function () {

            set_session_payment();
            forma_pagamento();
            calcula_frete();
        }

    }

}(); //Inicializa ao carregar


jQuery(document).ready(function () {

    $(window).keydown(function (event) {

        if (event.keyCode == 13) {

            event.preventDefault();
            return false;

        }

    });

    App_checkout.init();

});




