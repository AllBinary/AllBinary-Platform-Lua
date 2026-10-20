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
-- package org.allbinary.input.automation.log

-- local File = require("java.io.File")
-- local FileOutputStream = require("java.io.FileOutputStream")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ImageOutputData = require("org.allbinary.input.automation.ImageOutputData")
local LongUtil = require("org.allbinary.logic.java.number.LongUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FrameLog = {}
FrameLog.__index = FrameLog
FrameLog.className = "FrameLog"

function FrameLog:_init_fields()
    self.frame = nil
    self.infoStringBuffer = StringMaker.new()
    self.actionsStringBuffer = StringMaker.new()
end


function FrameLog.new(frame)
    local self = setmetatable({}, FrameLog)
    self:_init_fields()
        self.frame = frame
    return self
end


function FrameLog:addInfo(infoString)
        self.infoStringBuffer:append(infoString)
end


function FrameLog:addActions(vectorOfStrings)
        local size = vectorOfStrings:size()
        for index = 0, size - 1 do
            self:addAction(vectorOfStrings:get(index))
        end
end


function FrameLog:addAction(action)
        self.actionsStringBuffer:append(action)
        self.actionsStringBuffer:append(CommonSeps.getInstance().NEW_LINE)
end


-- throws Exception
function FrameLog:write()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(self.frame)))
        filePathStringBuffer:append(".txt")
        local filePath = tostring(filePathStringBuffer)
        local fileOutputStream = FileOutputStream.new(File.new(filePath))
        fileOutputStream:write(FrameLog.frameBytes)
        fileOutputStream:write({string.byte(tostring(self:getFrame()), 1, -1)})
        fileOutputStream:write("\n")
        fileOutputStream:write(FrameLog.info)
        fileOutputStream:write({string.byte(tostring(self.infoStringBuffer), 1, -1)})
        fileOutputStream:write("\n")
        fileOutputStream:write(FrameLog.actions)
        fileOutputStream:write({string.byte(tostring(self.actionsStringBuffer), 1, -1)})
        fileOutputStream:close()
end


function FrameLog:getFrame()
        return self.frame
end

FrameLog.frameBytes = tostring("Frame: "):getBytes()
FrameLog.info = tostring("Info: \n"):getBytes()
FrameLog.actions = tostring("Actions: \n"):getBytes()

return FrameLog

