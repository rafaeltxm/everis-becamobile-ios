# Conclusão do Projeto

Inicialmente tive que estudar um pouco a respeito de como seria a minha tomada de decisão a respeito da forma em que o aplicativo iria trablhar e como isso impactaria nas escolhas das camadas. 

Por se tratar de uma informação dinâmica consumida de uma API de tendências semanais, optei de princípio não trabalhar com a camada DAO e deixar todos esses registros em memória, e com isso consumir a API ao carregar a tela de Home. 

E penssando na praticidade da tela, mudei meu ponto de vista visando a utilização do aplicativo ao longo prazo, com a inteição de deixar o aplicativo mais inteligente, aplicando uma camada DAO utilizando o framework CoreData. 

Dessa forma criei a entidade Movie e trabalhei com isso o gerenciamento desses registros da API, o meu objetivo ideal era através de um campo da entidade, setar se o filme estava em alta ou não, com isso só salvaria os novos registros ou atualizaria filmes que sairam de tendência. Entretanto, com meu conhecimento do framework CoreData tive algumas barreiras na execução dessa ideia e por final utilizei um refresh básico que sempre atualizava conforme a entidade.

Na parte de layout, foi onde que fiquei mais tempo em desenvolvimento tendo como objetivo deixar o mais responsivo possível, mudei de ideia várias vezes na utilização ou não dos Stacks View Vertical/Horizontal, mas por se tratar de um aplicativo básico utilizei constraints pra lidar com esse controle.

Imagens da versão final:
 * Home: 
  - https://github.com/rafaeltxm/everis-becamobile-ios/blob/master/Preview%20App/home.png
 * Detalhes:
  - https://github.com/rafaeltxm/everis-becamobile-ios/blob/master/Preview%20App/detailsMovie.png
 * Icon:
  - https://github.com/rafaeltxm/everis-becamobile-ios/blob/master/Preview%20App/appIcon.png
 
# Avaliação Beca Mobile iOS

Criar um aplicativo que realize a listagem de filmes e exibição dos detalhes:
 * Tela principal, lista de filmes:
    - Listar capa dos filmes que são tendências da semana. 
 * Tela de detalhes do filme:  
    - Quando o usuário selecionar um filme, o aplicativo deve direciona-lo para uma segunda tela e exibir o título, capa, rating e sinopse. 

* API para consumo: 
  - A listagem de filmes deve ser consultada na API https://developers.themoviedb.org/3/getting-started/introduction 
    Ao se cadastrar você receberá uma chave de acesso, que deverá ser usada nas requisições. 
  - Requisição para listar as tendências https://developers.themoviedb.org/3/trending/get-trending
    - Ex.: https://api.themoviedb.org/3/trending/all/week?api_key=00000&language=pt-BR
  - Requisição para listar os detalhes https://developers.themoviedb.org/3/movies/get-movie-details
    - Ex.: https://api.themoviedb.org/3/movie/454626?api_key=00000&language=pt-BR
    
* Se opcionalmente quiser fazer o clone via SSH, segue ajuda do GitHub:
  - https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  - Se for usar o ssh para clone, este comando ajuda a salvar a chave de forma local: 
    - ssh-add -K ~/.ssh/id_rsa
  
* Ao iniciar a avaliação:
  - Faça um fork deste projeto
  - Fazer o cadastro no site para consumir a API
  
* Mandando bem na avaliação:
  - Realize quantos commits puder, não queremos somente a solução final; queremos saber como você chegou lá. Sua evolução vale tanto quanto o resultado final.
  - A arquitetura é livre, não se procupe com isto neste momento.
  - O Design é livre, mas se tiver um tempinho... gostariamos que fizesse uma revisão final, usando as dicas da Apple:
  https://developer.apple.com/design/tips/
  - Sugestões de bibliotecas:
     - Carregamento de imagens 
       - https://github.com/Alamofire/AlamofireImage
     - Requisições:
       - Opção 1) http https://github.com/Alamofire/Alamofire
       - Opção 2) https://github.com/Moya/Moya

* Ao finalizar a avaliação:
   - Quando finalizar a implementação faça um pull request; na descrição informe qual a abordagem que você utilizou para chegar na solução, descreva também quais foram os maiores desafios para concluir a avaliação.

* :clap: Parabéns por ter chegado até aqui! :smile: _Um grande abraço e bem vindo ao time Mobile iOS_ :iphone: :punch:
