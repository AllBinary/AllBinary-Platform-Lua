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
-- package org.allbinary.midlet

local TsUtil = require("org.allbinary.TsUtil")
local Processor = require("org.allbinary.canvas.Processor")
local Globals = require("org.allbinary.globals.Globals")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ClientInformationFactory = require("org.allbinary.logic.system.security.licensing.ClientInformationFactory")
local PrimaryThreadPool = require("org.allbinary.thread.PrimaryThreadPool")
local ThreadPool = require("org.allbinary.thread.ThreadPool")
local AllBinaryMidlet = require("org.allbinary.midlet.AllBinaryMidlet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--AndroidToJ2ME
local ProgressMidlet = {}
ProgressMidlet.__index = ProgressMidlet
ProgressMidlet.className = "ProgressMidlet"
setmetatable(ProgressMidlet, {__index = AllBinaryMidlet})

function ProgressMidlet:_init_fields()
    self.abeClientInformation = nil
end


function ProgressMidlet.new(clientInformationFactory)
    local self = setmetatable(AllBinaryMidlet.new(), ProgressMidlet)
    self:_init_fields()
        Globals.getInstance():init(TsUtil.getInstance():getClassClassLoader(self), StringUtil.getInstance().EMPTY_STRING)
        self:preInit()
        self.abeClientInformation = clientInformationFactory:getInstance()
    return self
end


function ProgressMidlet:preInit()
end


function ProgressMidlet:exitProgress(isProgress)
        local processor = MidletExitProcessorFactory.getInstance():getExitInstance(self)
        local try_ok, try_error = pcall(function()
            local primaryThreadPool = PrimaryThreadPool.getInstance()
            local runnable = ExitRunnable.new(self, processor, isProgress)
            primaryThreadPool:runTask(runnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "exit", e)
            local try_ok, try_error = pcall(function()
                processor:process()
            end)
            if not try_ok then
                local e2 = try_error
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "exit", e)
            end
        end
end

return ProgressMidlet

