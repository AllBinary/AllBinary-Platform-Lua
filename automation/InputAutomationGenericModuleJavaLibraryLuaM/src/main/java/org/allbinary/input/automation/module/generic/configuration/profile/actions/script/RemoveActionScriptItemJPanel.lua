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
-- package org.allbinary.input.automation.module.generic.configuration.profile.actions.script

local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local GenericProfileAction = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActionJPanel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActionJPanel")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Panel = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.Panel")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoveActionScriptItemJPanel = {}
RemoveActionScriptItemJPanel.__index = RemoveActionScriptItemJPanel
RemoveActionScriptItemJPanel.className = "RemoveActionScriptItemJPanel"
setmetatable(RemoveActionScriptItemJPanel, {__index = Panel})

function RemoveActionScriptItemJPanel:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.genericProfileActionJPanel = nil
    self.profileActionScriptConditionInterface = nil
    self.removeJButton = nil
end


function RemoveActionScriptItemJPanel.new(genericProfileActionJPanel, profileActionScriptConditionInterface)
    local self = setmetatable(Panel.new(), RemoveActionScriptItemJPanel)
    self:_init_fields()
        self:initComponents()
        self.genericProfileActionJPanel = genericProfileActionJPanel
        self.profileActionScriptConditionInterface = profileActionScriptConditionInterface
    return self
end


function RemoveActionScriptItemJPanel:initComponents()
        self.removeJButton = JButton.new()
        self:setLayout(GridLayout.new())
        self.removeJButton:setText("Remove")
        self.removeJButton:addActionListener((function()
            local o = ActionListener.new and ActionListener.new() or setmetatable({}, {__index = ActionListener})
            

            function o:actionPerformed(evt)
                self:removeJButtonActionPerformed(evt)
            end
            return o
        end)())
        self:add(self.removeJButton)
end


function RemoveActionScriptItemJPanel:removeJButtonActionPerformed(evt)
        local genericProfileAction = self.genericProfileActionJPanel:getGenericProfileAction()
        if genericProfileAction == nil then
            self.logUtil:putF("GenericProfileAction was null", self, "removeJButtonActionPerformed")
            return
        end
        genericProfileAction:getGenericProfileActionScript():removeCondition(self.profileActionScriptConditionInterface)
        self.genericProfileActionJPanel:updateProfileActionUI()
end

return RemoveActionScriptItemJPanel

