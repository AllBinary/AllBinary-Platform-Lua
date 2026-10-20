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
-- package org.allbinary.graphics.displayable.screen

-- local Desktop = require("java.awt.Desktop")
-- local URI = require("java.net.URI")
-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WebCommandProcessor = {}
WebCommandProcessor.__index = WebCommandProcessor
WebCommandProcessor.className = "WebCommandProcessor"

function WebCommandProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.aboutCommandProcessor = AboutCommandProcessor.getInstance()
    self.list = BasicArrayListD.new()
end

function WebCommandProcessor.new()
    local self = setmetatable({}, WebCommandProcessor)
    self:_init_fields()
    return self
end


function WebCommandProcessor.getInstance()
        return WebCommandProcessor.instance
end


function WebCommandProcessor:process(midletCommandListener, command, canvas)
        local try_ok, try_error = pcall(function()
            if Desktop.isDesktopSupported() and Desktop.getDesktop():isSupported(Desktop.Action.BROWSE) then
                Desktop.getDesktop():browse(URI.new(self.list:removeAt(0)))
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "process", e)
        end
end

WebCommandProcessor.instance = WebCommandProcessor.new()

return WebCommandProcessor

