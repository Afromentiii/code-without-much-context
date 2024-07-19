class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        merged_array = nums1 + nums2
        merged_array.sort()

        if len(merged_array) % 2 == 1:
            return float(merged_array[int(len(merged_array) / 2.0)])
        else:
            first = merged_array[int((len(merged_array) / 2.0) - 1)]
            second = merged_array[int((len(merged_array) / 2.0))]
            score = float((first + second) / 2.0)

            return float(score)

solucja = Solution()
print(solucja.findMedianSortedArrays([1,2],[3,4]))