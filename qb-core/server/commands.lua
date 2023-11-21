QBCore.Commands = {}
QBCore.Commands.List = {}

-- Register & Refresh Commands

function QBCore.Commands.Add(name, help, arguments, argsrequired, callback, permission)
    if type(permission) == 'string' then
        permission = permission:lower()
    else
        permission = 'user'
    end
    QBCore.Commands.List[name:lower()] = {
        name = name:lower(),
        permission = permission,
        help = help,
        arguments = arguments,
        argsrequired = argsrequired,
        callback = callback
    }
end

function QBCore.Commands.Refresh(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local suggestions = {}
    if Player then
        for command, info in pairs(QBCore.Commands.List) do
            local isGod = QBCore.Functions.HasPermission(src, 'god')
            local hasPerm = QBCore.Functions.HasPermission(src, QBCore.Commands.List[command].permission)
            local isPrincipal = IsPlayerAceAllowed(src, 'command')
            if isGod or hasPerm or isPrincipal then
                suggestions[#suggestions + 1] = {
                    name = '/' .. command,
                    help = info.help,
                    params = info.arguments
                }
            end
        end
        TriggerClientEvent('chat:addSuggestions', tonumber(source), suggestions)
    end
end

-- Teleport

QBCore.Commands.Add('tp', '傳送到玩家或座標 (管理員限定)', { { name = 'id/x', help = '玩家 ID 或 X 座標' }, { name = 'y', help = 'Y 座標' }, { name = 'z', help = 'Z 座標' } }, false, function(source, args)
    local src = source
    if args[1] and not args[2] and not args[3] then
        local target = GetPlayerPed(tonumber(args[1]))
        if target ~= 0 then
            local coords = GetEntityCoords(target)
            TriggerClientEvent('QBCore:Command:TeleportToPlayer', src, coords)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
        end
    else
        if args[1] and args[2] and args[3] then
            local x = tonumber(args[1])
            local y = tonumber(args[2])
            local z = tonumber(args[3])
            if (x ~= 0) and (y ~= 0) and (z ~= 0) then
                TriggerClientEvent('QBCore:Command:TeleportToCoords', src, x, y, z)
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.wrong_format'), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.missing_args'), 'error')
        end
    end
end, 'admin')

QBCore.Commands.Add('tpm', '傳送到標點 (管理員限定)', {}, false, function(source)
    local src = source
    TriggerClientEvent('QBCore:Command:GoToMarker', src)
end, 'admin')


QBCore.Commands.Add('togglepvp', '切換伺服器PVP (管理員限定)', {}, false, function(source)
    local src = source
    local pvp_state = QBConfig.Server.pvp
    QBConfig.Server.pvp = not pvp_state
    TriggerClientEvent('QBCore:Client:PvpHasToggled', -1, QBConfig.Server.pvp)
end, 'admin')
-- Permissions

QBCore.Commands.Add('addpermission', '給予玩家權限 (God Only)', { { name = 'id', help = '玩家 ID' }, { name = 'permission', help = '權限級別' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local permission = tostring(args[2]):lower()
    if Player then
        QBCore.Functions.AddPermission(Player.PlayerData.source, permission)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'god')

QBCore.Commands.Add('removepermission', '移除玩家權限 (God Only)', { { name = 'id', help = '玩家 ID' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        QBCore.Functions.RemovePermission(Player.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'god')

-- Vehicle

QBCore.Commands.Add('car', '生成載具 (管理員限定)', { { name = 'model', help = '模組名稱' } }, true, function(source, args)
    local src = source
    TriggerClientEvent('QBCore:Command:SpawnVehicle', src, args[1])
end, 'admin')

QBCore.Commands.Add('dv', 'Delete Vehicle (管理員限定)', {}, false, function(source)
    local src = source
    TriggerClientEvent('QBCore:Command:DeleteVehicle', src)
end, 'admin')

-- Money

QBCore.Commands.Add('givemoney', '給予玩家金錢 (管理員限定)', { { name = 'id', help = '玩家 ID' }, { name = 'moneytype', help = '金錢種類 (cash, bank, crypto)' }, { name = 'amount', help = '金額' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.AddMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'admin')

QBCore.Commands.Add('setmoney', '設定玩家金錢 (管理員限定)', { { name = 'id', help = '玩家 ID' }, { name = 'moneytype', help = '金錢種類 (cash, bank, crypto)' }, { name = 'amount', help = '金額' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetMoney(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'admin')

-- Job

QBCore.Commands.Add('job', '確認你的工作', {}, false, function(source)
    local src = source
    local PlayerJob = QBCore.Functions.GetPlayer(src).PlayerData.job
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.job_info', {value = PlayerJob.label, value2 = PlayerJob.grade.name, value3 = PlayerJob.onduty}))
end, 'user')

QBCore.Commands.Add('setjob', '給予玩家工作 (管理員限定)', { { name = 'id', help = '玩家 ID' }, { name = 'job', help = '工作名稱' }, { name = 'grade', help = '職位' } }, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        local job = tostring(args[2])
        local grade = tonumber(args[3])
        local sgrade = tostring(args[3])
        local jobInfo = QBCore.Shared.Jobs[job]
        if jobInfo then
            if jobInfo["grades"][sgrade] then
                Player.Functions.SetJob(job, grade)
                exports['qb-phone']:hireUser(job, Player.PlayerData.citizenid, grade)
            else
                TriggerClientEvent('QBCore:Notify', source, "不是有效的職位", 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, "不是有效的工作", 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_online'), 'error')
    end
end, 'admin')

-- Gang

QBCore.Commands.Add('gang', '確認你的幫派', {}, false, function(source)
    local src = source
    local PlayerGang = QBCore.Functions.GetPlayer(source).PlayerData.gang
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.gang_info', {value = PlayerGang.label, value2 = PlayerGang.grade.name}))
end, 'user')

QBCore.Commands.Add('setgang', '設定玩家幫派 (管理員限定)', { { name = 'id', help = '玩家 ID' }, { name = 'gang', help = '幫派名稱' }, { name = 'grade', help = '職位' } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        Player.Functions.SetGang(tostring(args[2]), tonumber(args[3]))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'admin')

-- Inventory (should be in qb-inventory?)

QBCore.Commands.Add('clearinv', '清除玩家物品庫 (管理員限定)', { { name = 'id', help = '玩家 ID' } }, false, function(source, args)
    local src = source
    local playerId = args[1] or src
    local Player = QBCore.Functions.GetPlayer(tonumber(playerId))
    if Player then
        Player.Functions.ClearInventory()
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_online'), 'error')
    end
end, 'admin')

-- Out of Character Chat

QBCore.Commands.Add('ooc', 'OOC 聊天訊息', {}, false, function(source, args)
    local src = source
    local message = table.concat(args, ' ')
    local Players = QBCore.Functions.GetPlayers()
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Players) do
        if v == src then
            TriggerClientEvent('chat:addMessage', v, {
                color = { 0, 0, 255},
                multiline = true,
                args = {'OOC | '.. GetPlayerName(src), message}
            })
        elseif #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(v))) < 20.0 then
            TriggerClientEvent('chat:addMessage', v, {
                color = { 0, 0, 255},
                multiline = true,
                args = {'OOC | '.. GetPlayerName(src), message}
            })
        elseif QBCore.Functions.HasPermission(v, 'admin') then
            if QBCore.Functions.IsOptin(v) then
                TriggerClientEvent('chat:addMessage', v, {
                    color = { 0, 0, 255},
                    multiline = true,
                    args = {'Proxmity OOC | '.. GetPlayerName(src), message}
                })
                TriggerEvent('qb-log:server:CreateLog', 'ooc', 'OOC', 'white', '**' .. GetPlayerName(src) .. '** (CitizenID: ' .. Player.PlayerData.citizenid .. ' | ID: ' .. src .. ') **Message:** ' .. message, false)
            end
        end
    end
end, 'user')

-- Me command

QBCore.Commands.Add('me', '顯示本地訊息', {{name = 'message', help = '訊息給身旁的人'}}, false, function(source, args)
    local src = source
    local ped = GetPlayerPed(src)
    local pCoords = GetEntityCoords(ped)
    local msg = table.concat(args, ' ')
    if msg == '' then return end
    for k,v in pairs(QBCore.Functions.GetPlayers()) do
        local target = GetPlayerPed(v)
        local tCoords = GetEntityCoords(target)
        if #(pCoords - tCoords) < 20 then
            TriggerClientEvent('QBCore:Command:ShowMe3D', v, src, msg)
        end
    end
end, 'user')

-- QBCore:ToggleDuty

QBCore.Commands.Add('toggleduty', '切換工作狀態', {}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.off_duty'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('info.on_duty'))
    end
    TriggerClientEvent('QBCore:Client:SetDuty', src, Player.PlayerData.job.onduty)
end, 'user')

QBCore.Commands.Add('removejob', 'Removes A Players Job (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'job', help = 'Job name' } }, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player then
        if Player.PlayerData.job.name == tostring(args[2]) then
            Player.Functions.SetJob("unemployed", 0)
        end
        exports['qb-phone']:fireUser(tostring(args[2]), Player.PlayerData.citizenid)
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_online'), 'error')
    end
end, 'admin')