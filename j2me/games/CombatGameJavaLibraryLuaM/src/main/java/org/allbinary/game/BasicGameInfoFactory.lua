-- Generated Code Do Not Modify
-- package org.allbinary.game

local BasicGameInfoFactory = {}
package.loaded["org.allbinary.game.BasicGameInfoFactory"] = BasicGameInfoFactory

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

-- class table BasicGameInfoFactory is declared before the requires
BasicGameInfoFactory.__index = BasicGameInfoFactory
BasicGameInfoFactory.className = "BasicGameInfoFactory"
BasicGameInfoFactory.javaClassName = "org.allbinary.game.BasicGameInfoFactory"

function BasicGameInfoFactory:_init_fields()
    if self.currentReleaseIndex == nil then self.currentReleaseIndex = 0 end
    if self.currentDestroyIndex == nil then self.currentDestroyIndex = 0 end
    if self.total == nil then self.total = 0 end
end


function BasicGameInfoFactory.getInstance()
        return BasicGameInfoFactory.SINGLETON
end


function BasicGameInfoFactory._jinit(self)
    BasicGameInfoFactory._init_fields(self)
    return self
end

function BasicGameInfoFactory.new(...)
    local self = setmetatable({}, BasicGameInfoFactory)
    BasicGameInfoFactory._jinit(self, ...)
    return self
end


function BasicGameInfoFactory:init(total)
        self.currentReleaseIndex = 0
        self.currentDestroyIndex = 0
        self.total = total
end


function BasicGameInfoFactory:isPeaked()
        if self.currentDestroyIndex >= self.total then
            return true
        else
            return false
        end
end


function BasicGameInfoFactory:howManyLeft()
        return self.total - self.currentDestroyIndex
end

BasicGameInfoFactory.SINGLETON = BasicGameInfoFactory.new()

return BasicGameInfoFactory

