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

-- local EGLConfig = require("javax.microedition.khronos.egl.EGLConfig")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
local InitEmulatorFactory = require("org.allbinary.emulator.InitEmulatorFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local EmulatorCustomRenderer = {}
EmulatorCustomRenderer.__index = EmulatorCustomRenderer
EmulatorCustomRenderer.className = "EmulatorCustomRenderer"

function EmulatorCustomRenderer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.renderStrings = RendererStrings.getInstance()
end

function EmulatorCustomRenderer.new()
    local self = setmetatable({}, EmulatorCustomRenderer)
    self:_init_fields()
    return self
end


function EmulatorCustomRenderer:onSurfaceCreated(gl, eglConfig)
        self.logUtil:putF(self.commonStrings.START, self, self.renderStrings.ON_SURFACE_CREATED)
        local initEmulatorFactory = InitEmulatorFactory.getInstance()
        if not initEmulatorFactory:isInitEmulator() then
            local try_ok, try_error = pcall(function()
                local WAIT_FOR_EMULATOR = "Waiting on Emulator Initialization"
                while not initEmulatorFactory:isInitEmulator() do
                    PreLogUtil.put(WAIT_FOR_EMULATOR, self, self.renderStrings.ON_SURFACE_CREATED)
                    java_sleep(180)
                end
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.renderStrings.ON_SURFACE_CREATED, e)
            end
        end
end

return EmulatorCustomRenderer

