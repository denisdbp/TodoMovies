# TodoMovies
Projeto Desafio TodoMovies Mobile2You

Decidi fazer o app um pouco diferente do que foi proposto no desafio. Criei o app com 2 telas, uma com a lista de filmes e a outra com os detalhes
do filme que foi selecionado na lista.

![tela1](https://user-images.githubusercontent.com/92686217/205069387-892b823a-8322-43f0-9d6f-2b8630f0b221.png) ![tela2](https://user-images.githubusercontent.com/92686217/205069410-b104c28e-34e9-41b8-883b-297cb97104dc.png)

A UI foi criada em ViewCode com definição de constraints por NSLayoutConstraint.
A responsividade ficou boa, testei no Ipad, Iphone 11, Iphone 8 Plus e IpodTouch, somente no IpodTouch que na tela de detalhes do filme a descrição
do filme ficou um pouco pequena, mas como ela pode ser scrollada é possível ler a descrição normalmente.

Já na arquitetura decidi por fazer utilizando MVVM com RxSwift, não consegui utilizar o RxSwift em tudo, mas estou estudando para me aprimorar
em programação reativa.

Para instalação do framework RxSwift utilizei o gerenciador de dependencias CocoaPods.

Em testes unitários, decidi por fazer testes referentes as requisições da API.

Nos teste de UI, testei para verificar se existe os elementos da tela de lista de filmes e dou um Tap na TableView da lista de filmes para assim
verificar se existe os elementos da tela de detalhes do filme.

Criei também teste de Snapshot utilizando SnapshotTesting, porem não consegui entender como ele funcionaria quando minha UI só recebe sua visualização
depois que a API é requisitada. Mas deixei um comentário no método de teste de Snapshot.

O framework SnapshotTesting eu instalei utilizando o gerenciador de dependencias SPM.

Deixei o app todo configurado com acessiblidade, então o VoiceOver pode ler todos os elementos que existem na tela. Fiz um teste do VoiceOver utilizando
o AccessibilityInspector do próprio Xcode.
