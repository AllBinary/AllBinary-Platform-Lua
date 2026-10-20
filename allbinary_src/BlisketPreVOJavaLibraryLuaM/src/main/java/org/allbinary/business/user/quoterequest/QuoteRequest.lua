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
-- package org.allbinary.business.user.quoterequest

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local EntryData = require("org.allbinary.business.entry.EntryData")
local QuoteRequestData = require("org.allbinary.business.quoterequest.QuoteRequestData")
local UserData = require("org.allbinary.business.user.UserData")
local QuoteRequestIdGenerator = require("org.allbinary.data.generator.QuoteRequestIdGenerator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local QuoteRequest = {}
QuoteRequest.__index = QuoteRequest
QuoteRequest.className = "QuoteRequest"

function QuoteRequest:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.id = nil
    self.userName = nil
    self.projectInfo = nil
    self.userComments = nil
    self.budget = nil
    self.timeFrame = nil
    self.comments = nil
end

function QuoteRequest.new(...)
    local count = select("#", ...)
    if count == 2 then return QuoteRequest._new2(...)
    elseif count == 1 then return QuoteRequest._new1(...)
    end
end


function QuoteRequest._new2(userName, request)
    local self = setmetatable({}, QuoteRequest)
    self:_init_fields()
        local quoteRequestData = QuoteRequestData.getInstance()
        self.id = QuoteRequestIdGenerator.new():getNext()
        self:setUserName(userName)
        self:setProjectInfo(request:getParameter(quoteRequestData.PROJECT_INFO))
        self:setUserComments(request:getParameter(quoteRequestData.CUSTOMER_COMMENTS))
        self:setBudget(request:getParameter(quoteRequestData.BUDGET))
        self:setTimeFrame(request:getParameter(quoteRequestData.TIMEFRAME))
        self:setComments(request:getParameter(quoteRequestData.COMMENTS))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
            self.logUtil:putF("Created with: " .. tostring(self:toHashMap()), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function QuoteRequest._new1(hashMap)
    local self = setmetatable({}, QuoteRequest)
    self:_init_fields()
        local quoteRequestData = QuoteRequestData.getInstance()
        self.id = hashMap:get(quoteRequestData.ID)
        self:setUserName(hashMap:get(UserData.USERNAME))
        self:setProjectInfo(hashMap:get(quoteRequestData.PROJECT_INFO))
        self:setUserComments(hashMap:get(quoteRequestData.CUSTOMER_COMMENTS))
        self:setBudget(hashMap:get(quoteRequestData.BUDGET))
        self:setTimeFrame(hashMap:get(quoteRequestData.TIMEFRAME))
        self:setComments(hashMap:get(quoteRequestData.COMMENTS))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
            self.logUtil:putF("Created with: " .. tostring(self:toHashMap()), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function QuoteRequest:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if self.userName == nil or #self.userName < 4 or #self.userName > 250 then
                valid = false
            end
            if self.projectInfo == nil or #self.projectInfo < 0 or #self.projectInfo > AbSqlData.MAXBLOB then
                valid = false
            end
            if self.userComments == nil or #self.userComments < 0 or #self.userComments > AbSqlData.MAXBLOB then
                valid = false
            end
            if self.budget == nil or #self.budget < 0 or #self.budget > AbSqlData.MAXBLOB then
                valid = false
            end
            if self.timeFrame == nil or #self.timeFrame < 0 or #self.timeFrame > AbSqlData.MAXBLOB then
                valid = false
            end
            if self.comments == nil or #self.comments < 0 or #self.comments > AbSqlData.MAXBLOB then
                valid = false
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function QuoteRequest:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.userName == nil or #self.userName < 4 or #self.userName > 250 then
                stringBuffer:append("Please enter a User Name with more than 4 characters.<br>")
            end
            if self.projectInfo == nil or #self.projectInfo < 0 or #self.projectInfo > AbSqlData.MAXBLOB then
                stringBuffer:append("Please enter Project Info with less than " .. tostring(AbSqlData.MAXBLOB) .. " characters.<br>")
            end
            if self.userComments == nil or #self.userComments < 0 or #self.userComments > AbSqlData.MAXBLOB then
                stringBuffer:append("Please enter User Comments with less than " .. tostring(AbSqlData.MAXBLOB) .. " characters.<br>")
            end
            if self.budget == nil or #self.budget < 0 or #self.budget > AbSqlData.MAXBLOB then
                stringBuffer:append("Please enter Budget with less than " .. tostring(AbSqlData.MAXBLOB) .. " characters.<br>")
            end
            if self.timeFrame == nil or #self.timeFrame < 0 or #self.timeFrame > AbSqlData.MAXBLOB then
                stringBuffer:append("Please enter time frame with less than " .. tostring(AbSqlData.MAXBLOB) .. " characters.<br>")
            end
            if self.comments == nil or #self.comments < 0 or #self.comments > AbSqlData.MAXBLOB then
                stringBuffer:append("Please enter comments with less than " .. tostring(AbSqlData.MAXBLOB) .. " characters.<br>")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function QuoteRequest:toVector()
        local values = BasicArrayListD.new()
        values:add(self.id)
        values:add(self.userName)
        values:add(self.projectInfo)
        values:add(self.userComments)
        values:add(self.budget)
        values:add(self.timeFrame)
        values:add(self.comments)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:add(time)
        values:add(time)
        return values
end


function QuoteRequest:toHashMap()
        local quoteRequestData = QuoteRequestData.getInstance()
        local values = StdUtil.getInstance():createHashMap()
        values:put(UserData.USERNAME, self.userName)
        values:put(quoteRequestData.PROJECT_INFO, self.projectInfo)
        values:put(quoteRequestData.CUSTOMER_COMMENTS, self.userComments)
        values:put(quoteRequestData.BUDGET, self.budget)
        values:put(quoteRequestData.TIMEFRAME, self.timeFrame)
        values:put(quoteRequestData.COMMENTS, self.comments)
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:put(EntryData.getInstance().LASTMODIFIED, time)
        return values
end


function QuoteRequest:setUserName(value)
        self.userName = value
end


function QuoteRequest:setProjectInfo(value)
        self.projectInfo = value
end


function QuoteRequest:setUserComments(value)
        self.userComments = value
end


function QuoteRequest:setBudget(value)
        self.budget = value
end


function QuoteRequest:setTimeFrame(value)
        self.timeFrame = value
end


function QuoteRequest:setComments(value)
        self.comments = value
        local stringUtil = StringUtil.getInstance()
        if self.comments == nil then
            self.comments = stringUtil.EMPTY_STRING
        end
end


function QuoteRequest:getUserName()
        return self.userName
end


function QuoteRequest:getProjectInfo()
        return self.projectInfo
end


function QuoteRequest:getUserComments()
        return self.userComments
end


function QuoteRequest:getBudget()
        return self.budget
end


function QuoteRequest:getTimeFrame()
        return self.timeFrame
end


function QuoteRequest:getComments()
        return self.comments
end

return QuoteRequest

