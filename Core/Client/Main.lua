Citizen.CreateThread(function()
    while not NetworkIsSessionActive() do 
        Wait(50) 
    end
    TriggerServerEvent('Ffw:InitPlayer')
end)

RegisterNetEvent("Ffw:InitPlayer")
AddEventHandler("Ffw:InitPlayer", function()
    for _,v in pairs (ZonesAdded) do
        v:showZone()
    end
    myPlayer = Player.new()
    if not CoreSett.useWantedLvl then
	    SetMaxWantedLevel(0)
    end
    if CoreSett.usePvp then
        SetCanAttackFriendly(PlayerPedId(), true, false)
	    NetworkSetFriendlyFireOption(true)
    end
end)
