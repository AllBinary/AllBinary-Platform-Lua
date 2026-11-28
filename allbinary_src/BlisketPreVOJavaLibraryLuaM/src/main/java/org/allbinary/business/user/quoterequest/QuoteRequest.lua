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

local QuoteRequest = {}
package.loaded["org.allbinary.business.user.quoterequest.QuoteRequest"] = QuoteRequest

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

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local QuoteRequestData = java_lazy("org.allbinary.business.quoterequest.QuoteRequestData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local QuoteRequestIdGenerator = java_lazy("org.allbinary.data.generator.QuoteRequestIdGenerator")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table QuoteRequest is declared before the requires
QuoteRequest.__index = QuoteRequest
QuoteRequest.className = "QuoteRequest"
QuoteRequest.javaClassName = "org.allbinary.business.user.quoterequest.QuoteRequest"

function QuoteRequest:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.id == nil then self.id = nil end
    if self.userName == nil then self.userName = nil end
    if self.projectInfo == nil then self.projectInfo = nil end
    if self.userComments == nil then self.userComments = nil end
    if self.budget == nil then self.budget = nil end
    if self.timeFrame == nil then self.timeFrame = nil end
    if self.comments == nil then self.comments = nil end
end

function QuoteRequest._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return QuoteRequest._new2(self, ...)
    elseif count == 1 then return QuoteRequest._new1(self, ...)
    end
    error("No constructor of QuoteRequest takes " .. count .. " arguments")
end

function QuoteRequest.new(...)
    local self = setmetatable({}, QuoteRequest)
    QuoteRequest._jinit(self, ...)
    return self
end


function QuoteRequest._new2(self, userName, request)
    QuoteRequest._init_fields(self)
        local quoteRequestData = QuoteRequestData.getInstance()
        self.id = QuoteRequestIdGenerator.new():getNext()
        self:setUserName(userName)
        self:setProjectInfo(request:getParameter(quoteRequestData.PROJECT_INFO))
        self:setUserComments(request:getParameter(quoteRequestData.CUSTOMER_COMMENTS))
        self:setBudget(request:getParameter(quoteRequestData.BUDGET))
        self:setTimeFrame(request:getParameter(quoteRequestData.TIMEFRAME))
        self:setComments(request:getParameter(quoteRequestData.COMMENTS))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
            self.logUtil:putF(require("allbinary_java").to_string("Created with: ") .. require("allbinary_java").to_string(self:toHashMap()), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function QuoteRequest._new1(self, hashMap)
    QuoteRequest._init_fields(self)
        local quoteRequestData = QuoteRequestData.getInstance()
        self.id = hashMap:get(quoteRequestData.ID)
        self:setUserName(hashMap:get(UserData.USERNAME))
        self:setProjectInfo(hashMap:get(quoteRequestData.PROJECT_INFO))
        self:setUserComments(hashMap:get(quoteRequestData.CUSTOMER_COMMENTS))
        self:setBudget(hashMap:get(quoteRequestData.BUDGET))
        self:setTimeFrame(hashMap:get(quoteRequestData.TIMEFRAME))
        self:setComments(hashMap:get(quoteRequestData.COMMENTS))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPER) then
            self.logUtil:putF(require("allbinary_java").to_string("Created with: ") .. require("allbinary_java").to_string(self:toHashMap()), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function QuoteRequest:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local valid = true
            if rawequal(self.userName, nil) or #self.userName < 4 or #self.userName > 250 then
                valid = false
            end
            if rawequal(self.projectInfo, nil) or #self.projectInfo < 0 or #self.projectInfo > AbSqlData.MAXBLOB then
                valid = false
            end
            if rawequal(self.userComments, nil) or #self.userComments < 0 or #self.userComments > AbSqlData.MAXBLOB then
                valid = false
            end
            if rawequal(self.budget, nil) or #self.budget < 0 or #self.budget > AbSqlData.MAXBLOB then
                valid = false
            end
            if rawequal(self.timeFrame, nil) or #self.timeFrame < 0 or #self.timeFrame > AbSqlData.MAXBLOB then
                valid = false
            end
            if rawequal(self.comments, nil) or #self.comments < 0 or #self.comments > AbSqlData.MAXBLOB then
                valid = false
            end
            do return "__jreturn", valid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function QuoteRequest:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            if rawequal(self.userName, nil) or #self.userName < 4 or #self.userName > 250 then
                stringBuffer:append("Please enter a User Name with more than 4 characters.<br>")
            end
            if rawequal(self.projectInfo, nil) or #self.projectInfo < 0 or #self.projectInfo > AbSqlData.MAXBLOB then
                stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Please enter Project Info with less than ") .. require("allbinary_java").to_string(AbSqlData.MAXBLOB)) .. require("allbinary_java").to_string(" characters.<br>"))
            end
            if rawequal(self.userComments, nil) or #self.userComments < 0 or #self.userComments > AbSqlData.MAXBLOB then
                stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Please enter User Comments with less than ") .. require("allbinary_java").to_string(AbSqlData.MAXBLOB)) .. require("allbinary_java").to_string(" characters.<br>"))
            end
            if rawequal(self.budget, nil) or #self.budget < 0 or #self.budget > AbSqlData.MAXBLOB then
                stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Please enter Budget with less than ") .. require("allbinary_java").to_string(AbSqlData.MAXBLOB)) .. require("allbinary_java").to_string(" characters.<br>"))
            end
            if rawequal(self.timeFrame, nil) or #self.timeFrame < 0 or #self.timeFrame > AbSqlData.MAXBLOB then
                stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Please enter time frame with less than ") .. require("allbinary_java").to_string(AbSqlData.MAXBLOB)) .. require("allbinary_java").to_string(" characters.<br>"))
            end
            if rawequal(self.comments, nil) or #self.comments < 0 or #self.comments > AbSqlData.MAXBLOB then
                stringBuffer:append(require("allbinary_java").to_string(require("allbinary_java").to_string("Please enter comments with less than ") .. require("allbinary_java").to_string(AbSqlData.MAXBLOB)) .. require("allbinary_java").to_string(" characters.<br>"))
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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
        if rawequal(self.comments, nil) then
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

