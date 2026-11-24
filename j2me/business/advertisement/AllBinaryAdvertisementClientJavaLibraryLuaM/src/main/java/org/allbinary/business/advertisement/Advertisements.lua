--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.business.advertisement

local Advertisements = {}
package.loaded["org.allbinary.business.advertisement.Advertisements"] = Advertisements

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

local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local LockedUtil = java_lazy("org.allbinary.logic.system.security.licensing.LockedUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AdvertisementProcessorInterface = java_lazy("org.allbinary.business.advertisement.AdvertisementProcessorInterface")

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

-- class table Advertisements is declared before the requires
Advertisements.__index = Advertisements
Advertisements.className = "Advertisements"
Advertisements.javaClassName = "org.allbinary.business.advertisement.Advertisements"

function Advertisements:_init_fields()
    self.bannerList = BasicArrayListD.new()
    self.pageList = BasicArrayListD.new()
    self.myRandomFactory = MyRandomFactory.getInstance()
end

function Advertisements._jinit(self)
    Advertisements._init_fields(self)
    return self
end

function Advertisements.new()
    return Advertisements._jinit(setmetatable({}, Advertisements))
end


function Advertisements:addPage(advertisementProcessorInterface)
        if not self.pageList:contains(advertisementProcessorInterface) then
            self.pageList:add(advertisementProcessorInterface)
        end
end


function Advertisements:startRandomPage()
        local size = self.pageList:size()
        if size > 0 then
            local random = self.myRandomFactory:getAbsoluteNextInt(size)
            local advertisementProcessorInterface = self.pageList.objectArray[random + 1]
            advertisementProcessorInterface:start()
        end
end


function Advertisements:processRandomPage()
        if LockedUtil.getInstance():isLocked() then
            local size = self.pageList:size()
            if size > 0 then
                local random = self.myRandomFactory:getAbsoluteNextInt(size)
                local advertisementProcessorInterface = self.pageList.objectArray[random + 1]
                advertisementProcessorInterface:process()
            end
        end
end


function Advertisements:stopAllPage()
        do
            local index = self.pageList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local advertisementProcessorInterface = self.pageList.objectArray[index + 1]
            advertisementProcessorInterface:stop()
            end
        end
end


function Advertisements:addBanner(advertisementProcessorInterface)
        if not self.bannerList:contains(advertisementProcessorInterface) then
            self.bannerList:add(advertisementProcessorInterface)
        end
end


function Advertisements:startAll()
        do
            local index = self.bannerList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local advertisementProcessorInterface = self.bannerList.objectArray[index + 1]
            advertisementProcessorInterface:start()
            end
        end
end


function Advertisements:stopAllBanner()
        do
            local index = self.bannerList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local advertisementProcessorInterface = self.bannerList.objectArray[index + 1]
            advertisementProcessorInterface:stop()
            end
        end
end


function Advertisements:getBanner(index)
        local advertisementProcessorInterface = self.bannerList.objectArray[index + 1]
        return advertisementProcessorInterface
end


function Advertisements:stopAll()
        self:stopAllBanner()
        self:stopAllPage()
end

return Advertisements

