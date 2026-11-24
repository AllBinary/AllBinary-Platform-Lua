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
-- package org.allbinary.graphics.opengles.renderer

local EmulatorCustomRenderer = {}
package.loaded["org.allbinary.graphics.opengles.renderer.EmulatorCustomRenderer"] = EmulatorCustomRenderer

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

-- local EGLConfig = require("javax.microedition.khronos.egl.EGLConfig")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local InitEmulatorFactory = java_lazy("org.allbinary.emulator.InitEmulatorFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table EmulatorCustomRenderer is declared before the requires
EmulatorCustomRenderer.__index = EmulatorCustomRenderer
EmulatorCustomRenderer.className = "EmulatorCustomRenderer"
EmulatorCustomRenderer.javaClassName = "org.allbinary.graphics.opengles.renderer.EmulatorCustomRenderer"

function EmulatorCustomRenderer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.renderStrings = RendererStrings.getInstance()
end

function EmulatorCustomRenderer._jinit(self)
    EmulatorCustomRenderer._init_fields(self)
    return self
end

function EmulatorCustomRenderer.new()
    return EmulatorCustomRenderer._jinit(setmetatable({}, EmulatorCustomRenderer))
end


function EmulatorCustomRenderer:onSurfaceCreated(gl, eglConfig)
        self.logUtil:putF(self.commonStrings.START, self, self.renderStrings.ON_SURFACE_CREATED)
        local initEmulatorFactory = InitEmulatorFactory.getInstance()
        if not initEmulatorFactory:isInitEmulator() then
            local try_ok, try_error, try_value = pcall(function()
                local WAIT_FOR_EMULATOR = "Waiting on Emulator Initialization"
                while not initEmulatorFactory:isInitEmulator() do
                    PreLogUtil.put(WAIT_FOR_EMULATOR, self, self.renderStrings.ON_SURFACE_CREATED)
                    java_sleep(180)
                end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
            end
        end
end

return EmulatorCustomRenderer

