# lul_procurado
Salve salve, scriptzinho que mostra quando tá procurado.

# Características
• Código simples<br>
• Até onde testei adaptável a maioria das telas<br>
• Comando /procurado ID TEMPO caso queira brincar<br>

# Possiveis atualizações
Colocar um comando para desabilitar a nui de procurado.<br>
Talvez criar um comando para a policia checar se a pessoa está procurada.<br>

# Usando em outro script
Digamos que você está na pasta de roubo a caixa eletrônico e quer conferir se a pessoa não está procurada

nomequevocêquiser = Proxy.getInterface("lul_procurado")

local tempo = nomequevocêquiser.retornarProcuradoComTempo(source,user_id)<br> retorna uma tabela<br>
```lua
if tempo[user_id] == 0 then
    nomequevocêquiser.setarProcurado(user_id,300) -- isso é == vRPidd.setarProcurado
end
```
# Suporte
Não tenho um discord privado, talvez futuramente, caso encontre algum bug favor mandar mensagem privado: bartlul#0608

obs: se acharem o design feio, lamento mas não é meu forte kkkk

Caso vá modificar e upar modificado favor dar os devidos créditos, grato!
