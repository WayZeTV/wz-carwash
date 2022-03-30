ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------

RegisterNetEvent('{-WayZe#0001-}::WashVehicle')
AddEventHandler('{-WayZe#0001-}::WashVehicle', function(price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

if xMoney >= price then
  xPlayer.removeMoney(price)
elseif xPlayer.getAccount("bank").money >= price then
  xPlayer.removeAccountMoney("bank", price)
else
  TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', '~r~Paiement refusé', "Merci de vérifier votre solde, il est insuffisant", "CHAR_BANK_MAZE", 1)
  return
end
TriggerClientEvent('{-WayZe#0001-}::UP', source)
end)