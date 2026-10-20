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
-- package org.allbinary.input.automation.module

-- local URL = require("java.net.URL")
-- local HelpSet = require("javax.help.HelpSet")
-- local swing = require("javax.swing")
local JavaHelpUtil = require("org.allbinary.logic.java.help.JavaHelpUtil")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbstractInputAutomationFactory = {}
AbstractInputAutomationFactory.__index = AbstractInputAutomationFactory
AbstractInputAutomationFactory.className = "AbstractInputAutomationFactory"
setmetatable(AbstractInputAutomationFactory, {__index = InputAutomationModuleFactoryInterface})

function AbstractInputAutomationFactory:_init_fields()
    self.name = nil
    self.jPanel = nil
    self.helpSet = nil
end

function AbstractInputAutomationFactory.new(...)
    local count = select("#", ...)
    if count == 3 then return AbstractInputAutomationFactory._new3(...)
    elseif count == 2 then return AbstractInputAutomationFactory._new2(...)
    end
end


function AbstractInputAutomationFactory._new3(name, jPanel, helpSet)
    local self = setmetatable(InputAutomationModuleFactoryInterface.new(), AbstractInputAutomationFactory)
    self:_init_fields()
        self.name = name
        self.jPanel = jPanel
        self.helpSet = helpSet
    return self
end


function AbstractInputAutomationFactory._new2(name, jPanel)
    local self = setmetatable(InputAutomationModuleFactoryInterface.new(), AbstractInputAutomationFactory)
    self:_init_fields()
        self.name = name
        self.jPanel = jPanel
        local url = getmetatable(self):getResource("/help/Help.hs")
        self.helpSet = JavaHelpUtil.getInstance():getHelpSet(url)
    return self
end


function AbstractInputAutomationFactory:getName()
        return self.name
end


function AbstractInputAutomationFactory:getConfigurationJPanel()
        return self.jPanel
end


function AbstractInputAutomationFactory:getHelpSet()
        return self.helpSet
end

return AbstractInputAutomationFactory

