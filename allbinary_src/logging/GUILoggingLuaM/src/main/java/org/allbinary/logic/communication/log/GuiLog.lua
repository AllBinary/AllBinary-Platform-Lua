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
-- package org.allbinary.logic.communication.log

local GuiLog = {}
package.loaded["org.allbinary.logic.communication.log.GuiLog"] = GuiLog

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

-- local GridLayout = require("java.awt.GridLayout")
-- local JDialog = require("javax.swing.JDialog")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
-- local JLabel = require("javax.swing.JLabel")
-- local JScrollPane = require("javax.swing.JScrollPane")
-- local JTextArea = require("javax.swing.JTextArea")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

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

-- class table GuiLog is declared before the requires
GuiLog.__index = GuiLog
GuiLog.className = "GuiLog"
GuiLog.javaClassName = "org.allbinary.logic.communication.log.GuiLog"

function GuiLog:_init_fields()
    self.logFormatUtil = LogFormatUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function GuiLog.getInstance()
        return GuiLog.instance_f
end


function GuiLog._jinit(self)
    GuiLog._init_fields(self)
    return self
end

function GuiLog.new(...)
    local self = setmetatable({}, GuiLog)
    GuiLog._jinit(self, ...)
    return self
end


function GuiLog:showDialog(msg)
        local error = JDialog.new()
        local size = #msg * 9
        local x = size
        if x > 550 then
            x = 550
        end
        error:getContentPane():setLayout(GridLayout.new(1, 1))
        if size > 255 then
            local y = 550
            error:setSize(x, y)
            error:getContentPane():add(JScrollPane.new(JTextArea.new(msg)))
        elseif size > 0 then
            local y = 50
            error:setSize(x, y)
            error:getContentPane():add(JScrollPane.new(JLabel.new(msg)))
        end
        error:show()
end


function GuiLog:put_j3_1(specialMessage, anyType, functionName)
        return self:put(specialMessage, anyType, functionName, nil)
end


function GuiLog:put_j4_1(specialMessage, anyType, functionName, exception)
        local try_ok, try_error, try_value = pcall(function()
            local data = self.logFormatUtil:get(specialMessage, (getmetatable(anyType).javaClassName or getmetatable(anyType).className), functionName, exception)
            self:showDialog(data)
            print(data)
            do return "__jreturn", data end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "put", e)
            return "Logging Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function GuiLog:put_j3_2(specialMessage, className, functionName)
        return self:put(specialMessage, className, functionName, nil)
end


function GuiLog:put_j4_2(specialMessage, className, functionName, exception)
        local try_ok, try_error, try_value = pcall(function()
            local data = self.logFormatUtil:get(specialMessage, className, functionName, exception)
            self:showDialog(data)
            print(data)
            do return "__jreturn", data end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "put", e)
            return "Logging Error"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function GuiLog:put(...)
    local count = select("#", ...)
    if count == 3 then return self:put_j3(...) end
    if count == 4 then return self:put_j4(...) end
    error("No method put takes " .. count .. " arguments")
end
GuiLog.put__jdispatcher = GuiLog.put
function GuiLog:put_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") then return GuiLog.put_j3_2(self, ...) end
    return GuiLog.put_j3_1(self, ...)
end
function GuiLog:put_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") and (java_a4 == nil or java_is(java_a4, "Exception")) then return GuiLog.put_j4_2(self, ...) end
    return GuiLog.put_j4_1(self, ...)
end

GuiLog.instance_f = GuiLog.new()

return GuiLog

