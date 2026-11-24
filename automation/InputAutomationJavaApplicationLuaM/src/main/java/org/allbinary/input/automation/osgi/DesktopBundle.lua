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

local DesktopBundle = {}
package.loaded["org.allbinary.input.automation.osgi.DesktopBundle"] = DesktopBundle

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

-- local JDialog = require("javax.swing.JDialog")
local Bundle = java_lazy("org.osgi.framework.Bundle")
local BundleContext = java_lazy("org.osgi.framework.BundleContext")
local InputAutomationBundleActivator = java_lazy("bundle.input.automation.InputAutomationBundleActivator")
local BasicTextJDialog = java_lazy("org.allbinary.gui.dialog.BasicTextJDialog")

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

-- class table DesktopBundle is declared before the requires
DesktopBundle.__index = DesktopBundle
DesktopBundle.className = "DesktopBundle"
DesktopBundle.javaClassName = "org.allbinary.input.automation.osgi.DesktopBundle"

function DesktopBundle:_init_fields()
    if self.bundle == nil then self.bundle = nil end
end


function DesktopBundle._jinit(self)
    DesktopBundle._init_fields(self)
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

function DesktopBundle.new(...)
    local self = setmetatable({}, DesktopBundle)
    DesktopBundle._jinit(self, ...)
    return self
end


-- throws Exception
function DesktopBundle:start()
        self.bundle:start()
end

DesktopBundle.DESKTOP_SYMBOLIC_NAME = "org.knopflerfish.bundle.desktop"

return DesktopBundle

