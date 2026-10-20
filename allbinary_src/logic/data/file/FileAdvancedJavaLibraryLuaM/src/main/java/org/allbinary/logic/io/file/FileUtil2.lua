-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.logic.io.file

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileUtil2 = {}
FileUtil2.__index = FileUtil2
FileUtil2.className = "FileUtil2"

function FileUtil2:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.streamUtil = StreamUtil.getInstance()
end


function FileUtil2.getInstance()
        return FileUtil2.instance
end


function FileUtil2.new()
    local self = setmetatable({}, FileUtil2)
    self:_init_fields()
    return self
end


function FileUtil2:loadFileAsList(file, max, byteArray1)
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            inputStream = AbFileInputStream.new(file)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
        end
        return SimpleFileUtil.getInstance():loadFileAsList(inputStream, max, byteArray1)
end

FileUtil2.instance = FileUtil2.new()

return FileUtil2

