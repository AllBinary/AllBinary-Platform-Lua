-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.graphics.displayable.screen

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
-- local Form = require("javax.microedition.lcdui.Form")
-- local NullCommandListener = require("javax.microedition.lcdui.NullCommandListener")
local Processor = require("org.allbinary.canvas.Processor")
local MenuListener = require("org.allbinary.game.displayable.canvas.MenuListener")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local MyCommandInterface = require("org.allbinary.graphics.displayable.command.MyCommandInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABStack = require("org.allbinary.util.ABStack")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommandForm = {}
CommandForm.__index = CommandForm
CommandForm.className = "CommandForm"
setmetatable(CommandForm, {__index = Form})

function CommandForm:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.repaintProcessor = ScreenRepaintProcessorFactory.getInstance():create(self)
    self.commandStack = nil
end


function CommandForm.getNullCommandForm()
        if CommandForm.NULL_COMMAND_FORM == NullUtil.getInstance().NULL_OBJECT then
            CommandForm.NULL_COMMAND_FORM = CommandForm.new(NullCommandListener.NULL_COMMAND_LISTENER, StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return CommandForm.NULL_COMMAND_FORM
end


function CommandForm.new(commandListener, formTitle, backgrounBasicColor, foregroundBasicColor)
    local self = setmetatable(Form.new(formTitle), CommandForm)
    self:_init_fields()
        -- super(...) made self above
        self.commandStack = StdUtil.getInstance():createStack()
        local try_ok, try_error = pcall(function()
            self.repaintProcessor:process()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function CommandForm:initCommands(cmdListener)
end


function CommandForm:open()
        self.logUtil:putF(self.commonStrings.START, self, "open")
end


-- throws Exception
function CommandForm:close()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CLOSE)
end


-- throws Exception
function CommandForm:update()
        self.repaintProcessor:process()
end


function CommandForm:getSourceId()
        return 0
end


function CommandForm:addCommand(command)
        self.commandStack:push(command)
        Form.addCommand(self, command)
end


function CommandForm:removeAllCommands()
        local size = self.commandStack:size()
        for index = 0, size - 1 do
            Form.removeCommand(self, self.commandStack:pop())
        end
end

CommandForm.NULL_COMMAND_FORM = NullUtil.getInstance().NULL_OBJECT

return CommandForm

