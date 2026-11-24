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
-- package org.allbinary.logic.communication.smtp.queue

local BasicEmailQueue = {}
package.loaded["org.allbinary.logic.communication.smtp.queue.BasicEmailQueue"] = BasicEmailQueue

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

-- local Transport = require("javax.mail.Transport")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local EmailInterface = java_lazy("org.allbinary.logic.communication.smtp.EmailInterface")
local BasicQueue = require("org.allbinary.logic.util.queue.BasicQueue")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local EmailQueueInterface = require("org.allbinary.logic.communication.smtp.queue.EmailQueueInterface")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table BasicEmailQueue is declared before the requires
BasicEmailQueue.__index = BasicEmailQueue
BasicEmailQueue.className = "BasicEmailQueue"
BasicEmailQueue.javaClassName = "org.allbinary.logic.communication.smtp.queue.BasicEmailQueue"
setmetatable(BasicEmailQueue, {__index = BasicQueue})
BasicEmailQueue.java_implements = " EmailQueueInterface "
BasicEmailQueue.java_interfaces = function() return {EmailQueueInterface} end

function BasicEmailQueue:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function BasicEmailQueue._jinit(self)
    java_super_init(BasicQueue, self)
    BasicEmailQueue._init_fields(self)
    return self
end

function BasicEmailQueue.new(...)
    local self = setmetatable({}, BasicEmailQueue)
    BasicEmailQueue._jinit(self, ...)
    return self
end


function BasicEmailQueue.getInstance()
        if BasicEmailQueue.basicEmailQueue == nil then
            BasicEmailQueue.basicEmailQueue = BasicEmailQueue.new()
        end
        return BasicEmailQueue.basicEmailQueue
end


-- throws Exception
function BasicEmailQueue:offer(emailInterface)
        self:offer(emailInterface)
        self:post(emailInterface)
        return true
end
java_overload(BasicEmailQueue, "offer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "EmailInterface")) end)


function BasicEmailQueue:remove_j1(emailInterface)
        self:remove(emailInterface)
end


function BasicEmailQueue:remove_j0()
        return nil
end
function BasicEmailQueue:remove(...)
    local count = select("#", ...)
    if count == 1 then return self:remove_j1(...) end
    if count == 0 then return self:remove_j0(...) end
    error("No method remove takes " .. count .. " arguments")
end
BasicEmailQueue.remove__jdispatcher = BasicEmailQueue.remove


-- throws Exception
function BasicEmailQueue:post(emailInterface)
        if self:send(emailInterface) then
            self:remove(emailInterface)
            self:processAllUnsent()
        end
end
java_overload(BasicEmailQueue, "post", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "EmailInterface")) end)


-- throws Exception
function BasicEmailQueue:processAllUnsent()
        local size = self.queueVector:size()
        for index = 0, size - 1 do
            local emailInterface = self.queueVector:get(index)
            if self:send(emailInterface) then
                self:remove(emailInterface)
                self:processAllUnsent()
            end
        end
end
java_overload(BasicEmailQueue, "processAllUnsent", 0)


function BasicEmailQueue:send(emailInterface)
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Sending: " .. tostring(emailInterface:log()), self, "send")
            end
            Transport.send(emailInterface:getMimeMessage())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Email Send Debug: " .. tostring(emailInterface:getDebugInfo()), self, "send")
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:put("Failed Email Send Debug: " .. tostring(emailInterface:getDebugInfo()), self, "send", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(BasicEmailQueue, "send", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "EmailInterface")) end)

BasicEmailQueue.instance_f = BasicEmailQueue.new()
BasicEmailQueue.basicEmailQueue = nil

return BasicEmailQueue

