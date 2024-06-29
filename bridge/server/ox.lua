if GetResourceState('ox_core') ~= 'started' then return end

local Ox = require '@ox_core.lib.init'

function GetPlayer(id)
    return Ox.GetPlayer(id)
end

function DoNotification(src, text, nType)
    TriggerClientEvent('QBCore:Notify', src, text, nType)
end

function GetCharacterName(Player)
    return Player.PlayerData.charinfo.firstname.. ' ' ..Player.PlayerData.charinfo.lastname
end

function GetPlayerJob(Player)
    return Player.PlayerData.job
end

function addSocietyFunds(job, amount, reason)
    -- exports['Renewed-Banking']:addAccountMoney(job, amount)
    -- Idk about this portion as PEFCL doesn't have great support for Job Accounts. Renewed Banking works best for society/job accounts.
end

function AddMoney(Player, moneyType, amount)
    -- exports['Renewed-Banking']:addAccountMoney(job, amount)
    exports.pefcl:addBankBalance(Player, { amount = amount, message = 'commission' })
end

function RemovePlayerMoney(Player, amount, moneyType)
    local balance = Player.Functions.GetMoney(moneyType)
    if balance >= amount then
        Player.Functions.RemoveMoney(moneyType, amount, 'billing')
        return true
    end
    return false
end
