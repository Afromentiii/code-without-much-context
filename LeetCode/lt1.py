class Solution(object):
    def twoSum(self, nums, target):
        index0 = 0
        index1 = 0
        flag = False
        
        for i in range(0, len(nums)):
            if flag == True:
                break
            for i2 in range(i + 1, len(nums)):
                if nums[i] + nums[i2] == target:
                    flag = True
                    index0 = i
                    index1 = i2
                    break

        return [index0, index1]