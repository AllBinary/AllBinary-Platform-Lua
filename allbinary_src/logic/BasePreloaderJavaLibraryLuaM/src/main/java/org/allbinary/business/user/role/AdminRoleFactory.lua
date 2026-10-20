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
-- package org.allbinary.business.user.role

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AdminRoleFactory = {}
AdminRoleFactory.__index = AdminRoleFactory
AdminRoleFactory.className = "AdminRoleFactory"

function AdminRoleFactory:_init_fields()
    self.adminRoles = BasicArrayListD.new()
    self.storeAdminRoles = BasicArrayListD.new()
    self.storeManagementRoles = BasicArrayListD.new()
    self.productManagementRoles = BasicArrayListD.new()
    self.reviewManagementRoles = BasicArrayListD.new()
    self.customerManagementRoles = BasicArrayListD.new()
    self.workflowManagementRoles = BasicArrayListD.new()
    self.orderManagementRoles = BasicArrayListD.new()
    self.adjusterManagementRoles = BasicArrayListD.new()
    self.shippingManagementRoles = BasicArrayListD.new()
    self.webManagementRoles = BasicArrayListD.new()
end


function AdminRoleFactory.getInstance()
        return AdminRoleFactory.instance
end


function AdminRoleFactory.new()
    local self = setmetatable({}, AdminRoleFactory)
    self:_init_fields()
        local basicUserRoleFactory = BasicUserRoleFactory.getInstance()
        self.adminRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.storeAdminRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.storeAdminRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.storeManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.storeManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.storeManagementRoles:add(basicUserRoleFactory.CUSTOMERMANAGER)
        self.storeManagementRoles:add(basicUserRoleFactory.ADJUSTER)
        self.storeManagementRoles:add(basicUserRoleFactory.PRODUCTMANAGER)
        self.storeManagementRoles:add(basicUserRoleFactory.REVIEWER)
        self.storeManagementRoles:add(basicUserRoleFactory.SHIPPING)
        self.productManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.productManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.productManagementRoles:add(basicUserRoleFactory.PRODUCTMANAGER)
        self.reviewManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.reviewManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.reviewManagementRoles:add(basicUserRoleFactory.REVIEWER)
        self.customerManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.customerManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.customerManagementRoles:add(basicUserRoleFactory.CUSTOMERMANAGER)
        self.workflowManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.workflowManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.workflowManagementRoles:add(basicUserRoleFactory.WORKFLOWEDITOR)
        self.orderManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.orderManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.adjusterManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.adjusterManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.adjusterManagementRoles:add(basicUserRoleFactory.ADJUSTER)
        self.shippingManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.shippingManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.shippingManagementRoles:add(basicUserRoleFactory.SHIPPING)
        self.webManagementRoles:add(basicUserRoleFactory.ADMINISTRATOR)
        self.webManagementRoles:add(basicUserRoleFactory.STOREMANAGER)
        self.webManagementRoles:add(basicUserRoleFactory.WEBMANAGER)
        self.webManagementRoles:add(basicUserRoleFactory.WORKFLOWEDITOR)
        self.webManagementRoles:add(basicUserRoleFactory.VIEWEDITOR)
    return self
end


function AdminRoleFactory:getProductManagementRoles()
        return self.productManagementRoles
end


function AdminRoleFactory:getAdminRoles()
        return self.adminRoles
end


function AdminRoleFactory:getStoreAdminRoles()
        return self.storeAdminRoles
end


function AdminRoleFactory:getStoreManagementRoles()
        return self.storeManagementRoles
end


function AdminRoleFactory:getReviewManagementRoles()
        return self.reviewManagementRoles
end


function AdminRoleFactory:getCustomerManagementRoles()
        return self.customerManagementRoles
end


function AdminRoleFactory:getWorkflowManagementRoles()
        return self.workflowManagementRoles
end


function AdminRoleFactory:getWebManagementRoles()
        return self.webManagementRoles
end


function AdminRoleFactory:getShippingManagementRoles()
        return self.shippingManagementRoles
end


function AdminRoleFactory:getAdjusterManagementRoles()
        return self.adjusterManagementRoles
end


function AdminRoleFactory:getOrderManagementRoles()
        return self.orderManagementRoles
end

AdminRoleFactory.instance = AdminRoleFactory.new()

return AdminRoleFactory

