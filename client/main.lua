Citizen.CreateThread(function()

    local hat = 0
    local texture = 0
    local timer = 0
	local player = PlayerPedId()

    while true do
        Wait(1000)
        player = PlayerPedId()
        if not IsPedInAnyVehicle(player,true) then
            hat = GetPedPropIndex(player,0)
            texture = GetPedPropTextureIndex(player,0)
        else
            timer = GetGameTimer()
            while not IsPedInAnyVehicle(player,false) or timer + 2000 < GetGameTimer() do
                Wait(0)
            end
            if IsPedInAnyVehicle(player,false) then
                SetPedPropIndex(player,0, hat, texture, 0)
                while IsPedInAnyVehicle(player,false) do
                    Wait(1000)
                end
            end
        end
    end
end)