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
-- package org.allbinary.input.automation.osgi

-- local swing = require("javax.swing")
local Bundle = require("org.osgi.framework.Bundle")
local BundleContext = require("org.osgi.framework.BundleContext")
local InputAutomationBundleActivator = require("bundle.input.automation.InputAutomationBundleActivator")
local BasicTextJDialog = require("org.allbinary.gui.dialog.BasicTextJDialog")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DesktopBundle = {}
DesktopBundle.__index = DesktopBundle
DesktopBundle.className = "DesktopBundle"

function DesktopBundle:_init_fields()
    self.bundle = nil
end


function DesktopBundle.new()
    local self = setmetatable({}, DesktopBundle)
    self:_init_fields()
        local bundleContext = InputAutomationBundleActivator.getBundleContext()
        if bundleContext ~= nil then
            local bundleArray = bundleContext:getBundles()
            for index = 0, (bundleArray.n or #bundleArray) - 1 do
                local bundle = bundleArray[index + 1]
                local symbolicName = bundle:getSymbolicName()
                if ((symbolicName < DesktopBundle.DESKTOP_SYMBOLIC_NAME and -1) or (symbolicName > DesktopBundle.DESKTOP_SYMBOLIC_NAME and 1) or 0) == 0 then
                    self.bundle = bundle
                end
            end
        else
            local textJDialog = BasicTextJDialog.new("BundlContext is Null")
            textJDialog:setVisible(true)
        end
    return self
end


-- throws Exception
function DesktopBundle:start()
        self.bundle:start()
end

DesktopBundle.DESKTOP_SYMBOLIC_NAME = "org.knopflerfish.bundle.desktop"

return DesktopBundle

