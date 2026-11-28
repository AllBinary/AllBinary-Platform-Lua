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

local FrameLog = {}
package.loaded["org.allbinary.input.automation.log.FrameLog"] = FrameLog

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

local File = java_lazy("java.io.File")
local FileOutputStream = java_lazy("java.io.FileOutputStream")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ImageOutputData = java_lazy("org.allbinary.input.automation.ImageOutputData")
local LongUtil = java_lazy("org.allbinary.logic.java.number.LongUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table FrameLog is declared before the requires
FrameLog.__index = FrameLog
FrameLog.className = "FrameLog"
FrameLog.javaClassName = "org.allbinary.input.automation.log.FrameLog"

function FrameLog:_init_fields()
    if self.frame == nil then self.frame = nil end
    self.infoStringBuffer = StringMaker.new()
    self.actionsStringBuffer = StringMaker.new()
end


function FrameLog._jinit(self, frame)
    FrameLog._init_fields(self)
        self.frame = frame
    return self
end

function FrameLog.new(...)
    local self = setmetatable({}, FrameLog)
    FrameLog._jinit(self, ...)
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

