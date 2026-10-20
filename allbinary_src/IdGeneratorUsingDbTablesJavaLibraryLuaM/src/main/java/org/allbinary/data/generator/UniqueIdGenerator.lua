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
-- package org.allbinary.data.generator

-- local IOException = require("java.io.IOException")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local IdGeneratorEntity = require("org.allbinary.data.tables.generator.IdGeneratorEntity")
local IdGeneratorEntityFactory = require("org.allbinary.data.tables.generator.IdGeneratorEntityFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local IdGeneratorInterface = require("org.allbinary.data.generator.IdGeneratorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UniqueIdGenerator = {}
UniqueIdGenerator.__index = UniqueIdGenerator
UniqueIdGenerator.className = "UniqueIdGenerator"

function UniqueIdGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.idGeneratorEntity = nil
    self.name = nil
end


function UniqueIdGenerator.new()
    local self = setmetatable({}, UniqueIdGenerator)
    self:_init_fields()
        self.idGeneratorEntity = IdGeneratorEntityFactory.getInstance()
    return self
end


function UniqueIdGenerator:initialize(value)
        local try_ok, try_error = pcall(function()
            local vector = BasicArrayListD.new()
            vector:add(self.name)
            vector:add(tostring(tostring(value)))
            self.idGeneratorEntity:insert(vector)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "initialize", e)
            end
        end
end


-- throws Exception
function UniqueIdGenerator:setFile(filePathName, name)
        self.name = name
end


-- throws IOException
function UniqueIdGenerator:getNext()
        local try_ok, try_error = pcall(function()
            local idLong = self.idGeneratorEntity:get(self.name)
            local newValue = tostring(math.tointeger(idLong // 1) + 1)
            self.idGeneratorEntity:update(self.name, newValue)
            return tostring(idLong)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getNext", e)
            end
            return "Error"
        end
end

UniqueIdGenerator.EXT = ".unq"

return UniqueIdGenerator

