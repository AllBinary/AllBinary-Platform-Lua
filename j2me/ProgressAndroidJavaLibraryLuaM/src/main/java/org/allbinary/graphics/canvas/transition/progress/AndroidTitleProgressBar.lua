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
-- package org.allbinary.graphics.canvas.transition.progress

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local NullProgressActivity = require("org.allbinary.android.activity.NullProgressActivity")
local ProgressActivityInterface = require("org.allbinary.android.activity.ProgressActivityInterface")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidTitleProgressBar = {}
AndroidTitleProgressBar.__index = AndroidTitleProgressBar
AndroidTitleProgressBar.className = "AndroidTitleProgressBar"
setmetatable(AndroidTitleProgressBar, {__index = ProgressCanvas})
local TitleProgressBarSetProgressRunnable = {}
    TitleProgressBarSetProgressRunnable.__index = TitleProgressBarSetProgressRunnable
    TitleProgressBarSetProgressRunnable.className = "TitleProgressBarSetProgressRunnable"
    AndroidTitleProgressBar.TitleProgressBarSetProgressRunnable = TitleProgressBarSetProgressRunnable

    function TitleProgressBarSetProgressRunnable:_init_fields()
        self.androidTitleProgressBar = nil
    end
    

    function AndroidTitleProgressBar.new(androidTitleProgressBar)
        local self = setmetatable({}, AndroidTitleProgressBar)
        self:_init_fields()
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error = pcall(function()
                local value = java_int(self.androidTitleProgressBar:getValue())
                self.androidTitleProgressBar.progressActivity:onTitleProgressBarSetProgress(value)
            end)
            if not try_ok then
                local e = try_error
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local TitleProgressBarPortionSetProgressRunnable = {}
    TitleProgressBarPortionSetProgressRunnable.__index = TitleProgressBarPortionSetProgressRunnable
    TitleProgressBarPortionSetProgressRunnable.className = "TitleProgressBarPortionSetProgressRunnable"
    AndroidTitleProgressBar.TitleProgressBarPortionSetProgressRunnable = TitleProgressBarPortionSetProgressRunnable

    function TitleProgressBarPortionSetProgressRunnable:_init_fields()
        self.androidTitleProgressBar = nil
    end
    

    function AndroidTitleProgressBar.new(androidTitleProgressBar)
        local self = setmetatable({}, AndroidTitleProgressBar)
        self:_init_fields()
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error = pcall(function()
                local value = java_int((self.androidTitleProgressBar:getValue() + self.androidTitleProgressBar:getMaxValue() / self.androidTitleProgressBar.portion))
                self.androidTitleProgressBar.progressActivity:onTitleProgressBarSetProgress(value)
            end)
            if not try_ok then
                local e = try_error
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local ShowTitleProgressBarRunnable = {}
    ShowTitleProgressBarRunnable.__index = ShowTitleProgressBarRunnable
    ShowTitleProgressBarRunnable.className = "ShowTitleProgressBarRunnable"
    AndroidTitleProgressBar.ShowTitleProgressBarRunnable = ShowTitleProgressBarRunnable

    function ShowTitleProgressBarRunnable:_init_fields()
        self.androidTitleProgressBar = nil
    end
    

    function AndroidTitleProgressBar.new(androidTitleProgressBar)
        local self = setmetatable({}, AndroidTitleProgressBar)
        self:_init_fields()
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error = pcall(function()
                local maxValue = java_int(self.androidTitleProgressBar:getMaxValue())
                self.androidTitleProgressBar.progressActivity:onShowTitleProgressBar(maxValue, false)
            end)
            if not try_ok then
                local e = try_error
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end

local DismissTitleProgressBarRunnable = {}
    DismissTitleProgressBarRunnable.__index = DismissTitleProgressBarRunnable
    DismissTitleProgressBarRunnable.className = "DismissTitleProgressBarRunnable"
    AndroidTitleProgressBar.DismissTitleProgressBarRunnable = DismissTitleProgressBarRunnable

    function DismissTitleProgressBarRunnable:_init_fields()
        self.androidTitleProgressBar = nil
    end
    

    function AndroidTitleProgressBar.new(androidTitleProgressBar)
        local self = setmetatable({}, AndroidTitleProgressBar)
        self:_init_fields()
            self.androidTitleProgressBar = androidTitleProgressBar
        return self
    end
    

    function AndroidTitleProgressBar:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local try_ok, try_error = pcall(function()
                self.androidTitleProgressBar.progressActivity:onDismissTitleProgressBar()
            end)
            if not try_ok then
                local e = try_error
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end


function AndroidTitleProgressBar:_init_fields()
    self.showTitleProgressBarRunnable = ShowTitleProgressBarRunnable.new(self)
    self.dismissTitleProgressBarRunnable = DismissTitleProgressBarRunnable.new(self)
    self.progressDialogPortionSetProgressRunnable = TitleProgressBarPortionSetProgressRunnable.new(self)
    self.progressDialogSetProgressRunnable = TitleProgressBarSetProgressRunnable.new(self)
    self.progressActivity = NullProgressActivity.NULL_PROGRESS_ACTIVITY
    self.portion = 0
end


function AndroidTitleProgressBar.new(title, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ProgressCanvas.new(title, backgroundBasicColor, foregroundBasicColor), AndroidTitleProgressBar)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function AndroidTitleProgressBar:init(activity)
        self.progressActivity = activity
end


function AndroidTitleProgressBar:isInitialized()
        if self.progressActivity ~= NullProgressActivity.NULL_PROGRESS_ACTIVITY then
            return true
        else
            return false
        end
end


function AndroidTitleProgressBar:start()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
            ProgressCanvas.start(self)
            self.progressActivity:runOnUiThread(self.showTitleProgressBarRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end


function AndroidTitleProgressBar:end_()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
            self.progressActivity:runOnUiThread(self.dismissTitleProgressBarRunnable)
            ProgressCanvas.end_(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME, e)
        end
end


function AndroidTitleProgressBar:addPortion(value, text, index)
        local try_ok, try_error = pcall(function()
            ProgressCanvas.addPortion(self, value, text, index)
            self.portion = value
            self.progressActivity:runOnUiThread(self.progressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end


function AndroidTitleProgressBar:addNormalPortion(value, text)
        local try_ok, try_error = pcall(function()
            ProgressCanvas.addNormalPortion(self, value, text)
            self.portion = value
            self.progressActivity:runOnUiThread(self.progressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end


function AndroidTitleProgressBar:setValue(value)
        local try_ok, try_error = pcall(function()
            ProgressCanvas.setValue(self, value)
            self.progressActivity:runOnUiThread(self.progressDialogSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setValue", e)
        end
end


function AndroidTitleProgressBar:waitUntilDisplayed()
end


function AndroidTitleProgressBar:paint(graphics)
end

return AndroidTitleProgressBar

