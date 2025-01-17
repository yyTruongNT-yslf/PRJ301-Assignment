/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
public class Plan {

    private int id;
    private String name;
    private Date start;
    private Date end;
    private Department dept;
    private double totalAccumulate;
    private double remainingQuantity;
    private String status;
    private ArrayList<PlanCampaign> campaigns = new ArrayList<>();

    public double getTotalAccumulate() {
        return totalAccumulate;
    }

    public void setTotalAccumulate(double totalAccumulate) {
        this.totalAccumulate = totalAccumulate;
    }

    public double getRemainingQuantity() {
        return remainingQuantity;
    }

    public void setRemainingQuantity(double remainingQuantity) {
        this.remainingQuantity = remainingQuantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public ArrayList<PlanCampaign> getCampaigns() {
        return campaigns;
    }

    public void setCampaigns(ArrayList<PlanCampaign> campaigns) {
        this.campaigns = campaigns;
    }

}
