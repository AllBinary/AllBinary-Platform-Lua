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
-- package org.allbinary.logic.java.help

-- local awt = require("java.awt")
-- local ActionEvent = require("java.awt.event.ActionEvent")
-- local File = require("java.io.File")
-- local URI = require("java.net.URI")
-- local URL = require("java.net.URL")
-- local CSH = require("javax.help.CSH")
-- local HelpBroker = require("javax.help.HelpBroker")
-- local HelpSet = require("javax.help.HelpSet")
-- local swing = require("javax.swing")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local JavaHelpUtil = {}
JavaHelpUtil.__index = JavaHelpUtil
JavaHelpUtil.className = "JavaHelpUtil"

function JavaHelpUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.point = Point.new(0, 0)
    self.dimension = Dimension.new(640, 480)
    self.contextSensitiveHelpActionEvent = ActionEvent.new(JLabel.new(), ActionEvent.ACTION_FIRST, nil)
    self.commonStrings = CommonStrings.getInstance()
end


function JavaHelpUtil.getInstance()
        return JavaHelpUtil.instance
end


function JavaHelpUtil.new()
    local self = setmetatable({}, JavaHelpUtil)
    self:_init_fields()
    return self
end


function JavaHelpUtil:getHelpSet(filePath)
        local try_ok, try_error = pcall(function()
            local helpSetURI = File.new(filePath):toURI()
            local helpSetURL = helpSetURI:toURL()
            return self:getHelpSet(helpSetURL)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, JavaHelpUtil.getInstance(), "set", e)
            return nil
        end
end


-- Java overloaded method: Lua keeps the last definition
function JavaHelpUtil:getHelpSet(url)
        local try_ok, try_error = pcall(function()
            return HelpSet.new(nil, url)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, JavaHelpUtil.getInstance(), "set", e)
            return nil
        end
end


function JavaHelpUtil:show(helpSet)
        local try_ok, try_error = pcall(function()
            local helpBroker = helpSet:createHelpBroker()
            helpBroker:setLocation(self.point)
            helpBroker:setSize(self.dimension)
            DisplayHelpFromSource.new(helpBroker):actionPerformed(self.contextSensitiveHelpActionEvent)
            self.logUtil:putF("CSH Action", JavaHelpUtil.getInstance(), "show")
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, JavaHelpUtil.getInstance(), "show", e)
        end
end


function JavaHelpUtil.main(args)
        local try_ok, try_error = pcall(function()
            local javaHelpUtil = JavaHelpUtil.getInstance()
            javaHelpUtil:show(javaHelpUtil:getHelpSet("G:/mnt/bc/mydev/working/automation/InputAutomationJavaApplication/AllBinaryInputAutomationHelp/AllBinaryInputAutomation.hs"))
        end)
        if not try_ok then
            local e = try_error
        end
end

JavaHelpUtil.instance = JavaHelpUtil.new()

return JavaHelpUtil

