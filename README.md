# Joginho de plantação

Jogo para ser utilizado em sala de aula para motivar o ensino de PA e PG e investigação nas aulas de matemática.

Esse jogo foi utilizado em sala de aula com os alunos utilizando iPad, mas também é possível usar computador ou celular.

Para jogar acesse https://gfth4x07.github.io/fertil/

A pasta arquivos contém atividades feitas com alunos, a Atividade 1 foi usada como um registro para os alunos fazerem enquanto
conheciam o jogo. Já a Atividade 2 foi uma atividade formativa onde os alunos em dupla e com o jogo em mãos tinha de responder
as questões para computar uma nota, o interessante é que a atividade contém questões que podem ser simulada no jogo e questões
que não são possíveis simular no jogo, exigindo assim um pensamento mais critico


## Placar
Feito com SilentWolf (https://silentwolf.com/leaderboard) com uma pequena alteração.

Precisou mudar o código em SilentWolf.gd linha 147 de while 
```bash
if !http_node.is_inside_tree():
```
para 
```bash
while !http_node.is_inside_tree():
```
Pois quando o placar era executado como sena funcionava, mas durante o jogo não.
