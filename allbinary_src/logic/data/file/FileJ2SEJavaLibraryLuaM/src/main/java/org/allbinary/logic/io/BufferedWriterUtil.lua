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
-- package org.allbinary.logic.io

-- local BufferedWriter = require("java.io.BufferedWriter")
-- local FileWriter = require("java.io.FileWriter")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedWriterUtil = {}
BufferedWriterUtil.__index = BufferedWriterUtil
BufferedWriterUtil.className = "BufferedWriterUtil"

function BufferedWriterUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonLabels = CommonLabels.getInstance()
    self.REMOVING_OLD = "Remove old for overwriting: "
end

function BufferedWriterUtil.new()
    local self = setmetatable({}, BufferedWriterUtil)
    self:_init_fields()
    return self
end


function BufferedWriterUtil.getInstance()
        return BufferedWriterUtil.instance
end


-- throws Exception
function BufferedWriterUtil:overwrite(path, data)
        local abFile = AbFile.createAbFile(path)
        if abFile:exists() then
            self.logUtil:putF(self.REMOVING_OLD .. path, self, self.commonStrings.CREATE)
            abFile:delete()
        else
            local name = AbPathData.getInstance():removeNameFromPath(path)
            local abFileDirectory = AbFile.createAbFile(name)
            if abFileDirectory:exists() then
            else
                local stringBuilder = StringMaker.new()
                self.logUtil:putF(tostring(stringBuilder:append(self.commonStrings.CREATE):append(self.commonLabels.COLON_SEP):append(name)), self, self.commonStrings.CREATE)
                local result = abFileDirectory:mkdirs()
                stringBuilder:delete(0, stringBuilder:length())
                self.logUtil:putF(tostring(stringBuilder:append(self.commonLabels.RESULT_):appendboolean(result)), self, self.commonStrings.CREATE)
            end
        end
        self:write(abFile, data)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function BufferedWriterUtil:overwrite(abFile, data)
        if abFile:exists() then
            self.logUtil:putF(self.REMOVING_OLD .. tostring(abFile:getPath()), self, self.commonStrings.CREATE)
            abFile:delete()
        else
            local name = AbPathData.getInstance():removeNameFromPath(abFile:getAbsolutePath())
            local abFileDirectory = AbFile.createAbFile(name)
            if abFileDirectory:exists() then
            else
                local stringBuilder = StringMaker.new()
                self.logUtil:putF(tostring(stringBuilder:append(self.commonStrings.CREATE):append(self.commonLabels.COLON_SEP):append(name)), self, self.commonStrings.CREATE)
                local result = abFileDirectory:mkdirs()
                stringBuilder:delete(0, stringBuilder:length())
                self.logUtil:putF(tostring(stringBuilder:append(self.commonLabels.RESULT_):appendboolean(result)), self, self.commonStrings.CREATE)
            end
        end
        self:write(abFile, data)
end


-- throws Exception
function BufferedWriterUtil:write(abFile, data)
        local fileOut = BufferedWriter.new(FileWriter.new(AbFileNativeUtil.get(abFile)))
        fileOut:write(data, 0, #data)
        fileOut:newLine()
        fileOut:flush()
end

BufferedWriterUtil.instance = BufferedWriterUtil.new()

return BufferedWriterUtil

