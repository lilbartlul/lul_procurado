-----------------------------------------------------------------------------------------------------------------------------------------
-- importa os Utils do VRP
-----------------------------------------------------------------------------------------------------------------------------------------	
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
-----------------------------------------------------------------------------------------------------------------------------------------
-- importa os Tunneis e Proxys
-----------------------------------------------------------------------------------------------------------------------------------------	
vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
vRPidd = {}
Tunnel.bindInterface("lul_procurado",vRPidd)
Proxy.addInterface("lul_procurado",vRPidd)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Modo para chamar as funções de vRPidd em outro script
-----------------------------------------------------------------------------------------------------------------------------------------	
-- vRPidd = Proxy.getInterface("lul_procurado") -- server
-- apenas chamar vRPidd.nomedafuncao ex: vRPidd.retornarProcuradoComTempo(source,user_id) retornara se está procurado ou não.
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
local search = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(search) do
			if v > 0 and vRP.getUserSource(k) then
				search[k] = v - 1
				if v == 0 then
					search[k] = nil
				end
			end
		end
	end
end)

function vRPidd.enviandoTabelaJS()
	local user_id = vRP.getUserId(source)
	if search[user_id] then
	TriggerClientEvent('passandoTabela',source,search)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- retornarProcurado com tempo
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPidd.retornarProcuradoComTempo(source,user_id)
	if search[user_id] ~= nil and search[user_id] > 0 then
	    return search
	else
		return search
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setarProcurado
-----------------------------------------------------------------------------------------------------------------------------------------
function vRPidd.setarProcurado(user_id,timer)
	if search[user_id] == 0 or not search[user_id] then
		search[user_id] = parseInt(timer)
	else
		search[user_id] = search[user_id] + parseInt(timer)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- setarProcurado com comando /procurado ID TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('procurado',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nuser_id = parseInt(args[1])
	local identity = vRP.getUserIdentity(nuser_id)

	if vRP.hasPermission(user_id,"mindmaster.permissao") then

		if args[1] and args[2] then
			
			if nuser_id then
				vRPidd.setarProcurado(nuser_id,tonumber(args[2]*60))
				TriggerClientEvent("Notify",source,"sucesso","Colocou o cidadão:"..identity.name.." procurado por: "..tonumber(args[2]).." minutos.")
			else
				TriggerClientEvent("Notify",source,"negado","Cidadão ausente.")
			end

		end

	end

end)