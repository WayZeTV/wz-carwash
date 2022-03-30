ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

function OpenCarwashWZ()
    local Main = RageUI.CreateMenu(Config.Menu.Banner, Config.Menu.Title) 

    RageUI.Visible(Main, not RageUI.Visible(Main))

    while Main do 
    Citizen.Wait(0)

        RageUI.IsVisible(Main, true, true, true, function()

            RageUI.Separator(Config.Menu.Question)

            RageUI.Button(Config.Menu.Button, ""..Config.Menu.ButtonBot.." "..Config.Menu.Price.." $", {RightLabel = ""..Config.Menu.Price.."$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::WashVehicle', Config.Menu.Price)
                end
            end)
        
            end, function()
        end)

        if not RageUI.Visible(Main) then
            Main = RMenu:DeleteType("Main", true)
            end
        end
    end

RegisterNetEvent('{-WayZe#0001-}::UP')
AddEventHandler('{-WayZe#0001-}::UP', function()
    local veh = WashDecalsFromVehicle(GetVehiclePedIsUsing(PlayerPedId()), -1)
    SetVehicleDirtLevel(veh, 0)
    ESX.ShowAdvancedNotification('Banque', '~g~Paiement accepté', "Merci pour votre confiance, votre véhicule est propre !", "CHAR_BANK_MAZE", 1)
    RageUI.CloseAll()
end)

-- BLIPS

local blips = {
	{x = 26.5906, y = -1392.0261, z = 27.3634},
	{x = 167.1034, y = -1719.4704, z = 27.2916},
	{x = -74.5693, y = 6427.8715, z = 29.4400},
	{x = -699.6325, y = -932.7043, z = 17.0139}
}

Citizen.CreateThread(function()
for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, Config.Blips.type)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, Config.Blips.scale)
  SetBlipColour(info.blip, Config.Blips.color)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(Config.Blips.name)
  EndTextCommandSetBlipName(info.blip)
end
end)

-- MARKER AU SOL + INTERACTION


Citizen.CreateThread(function()
    while true do
        local wait = 1000
        for k in pairs(Config.Blips.position) do
            
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.Blips.position
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            local playerPed = PlayerPedId()

            if IsPedSittingInAnyVehicle(playerPed) then
            if dist <= Config.Marker.drawdistance then
               wait = 0
                DrawMarker(Config.Marker.type, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Marker.size.x, Config.Marker.size.y, Config.Marker.size.z, Config.Marker.color.r, Config.Marker.color.g, Config.Marker.color.b, 100, Config.Marker.jumped, true, 2, Config.Marker.turned, false, false, false)
            end
        end

        if IsPedSittingInAnyVehicle(playerPed) then
            if dist <= 1.0 then
                wait = 0
                ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour intéragir avec la station de lavage")
                    if IsControlJustPressed(1,51) then
                        OpenCarwashWZ()
                    end
                    end
                end
            end
        Citizen.Wait(wait)
    end
end)