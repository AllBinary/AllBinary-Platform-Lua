-- Generated Code Do Not Modify
-- package org.allbinary.business.advertisement

local GameAdStateFactory = {}
package.loaded["org.allbinary.business.advertisement.GameAdStateFactory"] = GameAdStateFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local GameAdState = java_lazy("org.allbinary.game.GameAdState")
local SoftwareInformation = java_lazy("org.allbinary.logic.system.SoftwareInformation")
local GameAdStateFactoryInterface = require("org.allbinary.business.advertisement.GameAdStateFactoryInterface")
local AppNameLicensingAdConfiguration = java_lazy("org.allbinary.business.advertisement.AppNameLicensingAdConfiguration")
local GameAdStateBase = java_lazy("org.allbinary.business.advertisement.GameAdStateBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameAdStateFactory is declared before the requires
GameAdStateFactory.__index = GameAdStateFactory
GameAdStateFactory.className = "GameAdStateFactory"
GameAdStateFactory.javaClassName = "org.allbinary.business.advertisement.GameAdStateFactory"
GameAdStateFactory.java_implements = " GameAdStateFactoryInterface "
GameAdStateFactory.java_interfaces = function() return {GameAdStateFactoryInterface} end

function GameAdStateFactory:_init_fields()
    self.gameAdStateArray = {GameAdState.new(AppNameLicensingAdConfiguration.new())}
    self.gameAdState = self.gameAdStateArray[1]
end

function GameAdStateFactory._jinit(self)
    GameAdStateFactory._init_fields(self)
    return self
end

function GameAdStateFactory.new()
    return GameAdStateFactory._jinit(setmetatable({}, GameAdStateFactory))
end


function GameAdStateFactory.getInstance()
        return GameAdStateFactory.instance_f
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

GameAdStateFactory.instance_f = GameAdStateFactory.new()

return GameAdStateFactory

