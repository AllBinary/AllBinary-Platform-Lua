-- Generated Code Do Not Modify
-- package org.allbinary.business.advertisement

local GameAdState = require("org.allbinary.game.GameAdState")
local SoftwareInformation = require("org.allbinary.logic.system.SoftwareInformation")
local GameAdStateFactoryInterface = require("org.allbinary.business.advertisement.GameAdStateFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameAdStateFactory = {}
GameAdStateFactory.__index = GameAdStateFactory
GameAdStateFactory.className = "GameAdStateFactory"

function GameAdStateFactory:_init_fields()
    self.gameAdStateArray = {GameAdState.new(AppNameLicensingAdConfiguration.new())}
    self.gameAdState = self.gameAdStateArray[1]
end

function GameAdStateFactory.new()
    local self = setmetatable({}, GameAdStateFactory)
    self:_init_fields()
    return self
end


function GameAdStateFactory.getInstance()
        return GameAdStateFactory.instance
end


function GameAdStateFactory:getCurrentInstance()
        return self.gameAdState
end


-- throws Exception
function GameAdStateFactory:getInstanceForApp(softwareInformation)
        self.gameAdState = self.gameAdStateArray[1]
        return self.gameAdStateArray[1]
end


function GameAdStateFactory:isEnabled()
        return false
end

GameAdStateFactory.instance = GameAdStateFactory.new()

return GameAdStateFactory

