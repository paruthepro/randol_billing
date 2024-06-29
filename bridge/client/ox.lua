if GetResourceState('ox_core') ~= 'started' then return end

local Ox = require '@ox_core.lib.init'

AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    initGlobal(PlayerData.job.name)
end)

AddEventHandler('onResourceStart', function(res)
    if GetCurrentResourceName() ~= res or not LocalPlayer.state.isLoggedIn then return end
    PlayerData = QBCore.Functions.GetPlayerData()
    ChargeZones(PlayerData.job.name)
end)

function hasPlyLoaded()
    return LocalPlayer.state.isLoggedIn
end

function DoNotification(text, nType)
    QBCore.Functions.Notify(text, nType)
end

function GetJobLabel(job)
    return QBCore.Shared.Jobs[job].label
end