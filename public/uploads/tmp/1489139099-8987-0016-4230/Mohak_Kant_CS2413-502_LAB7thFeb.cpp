// Header Files
#include <iostream>
#include <cstdlib>
using namespace std;
//Header Files End

//Function to print out an array of given size
void display(double* arr, int n){
    for(int i = 0;i<n;i++)
        cout<<arr[i]<<" ";
    cout<<endl;
}
//Function to print out an array of given size ends

//Bubble Sort Function - Shows Array at Each Step
void bubbleSort(double *arr, int sizeOfArray){

    cout<<"Sorting Using: Bubble Sort"<<endl;

    cout<<"Steps: \n\n";
    double temp;
    bool swapped = false;
    for(int i=0; i<sizeOfArray;i++)
    for(int j=0;j<sizeOfArray-1;j++){
        cout<<"\nItems Compared: "<<arr[j]<<" and "<<arr[j+1]<<endl;
        if(arr[j]>arr[j+1]){
            cout<<"Swapping "<<arr[j]<<" and "<<arr[j+1]<<endl;
            temp = arr[j];
            arr[j] = arr[j+1];
            arr[j+1] = temp;
            cout<<"Array Now: ";
            display(arr, sizeOfArray);
            cout<<endl;
            swapped = true;
        } else cout<<"Not Swapped\n";

        if(!swapped)
         break;
    }
}
//Bubble Sort Function Ends

//Insertion Sort Function
void insertionSort(double *arr, int sizeOfArray){

    cout<<"Sorting Using: Insertion Sort"<<endl;

    double key;
    for(int i = 0,j=0;i<sizeOfArray;i++){
        key = arr[i];
        j = i-1;
        while(j>=0 && arr[j]>key){
            arr[j+1] = arr[j];
            j--;
        }
        arr[j+1] = key;
    }
}
//Insertion Sort Function Ends

//Selections Sort
void selectionSort(double *arr, int sizeOfArray){

    cout<<"Sorting Using: Selection Sort\n";

    int minimum, minimum_index, temp;
    for(int i = 0; i<sizeOfArray;i++){
            minimum = arr[i];
            minimum_index = i;
            for(int j = i+1;j<sizeOfArray;j++){
                if(minimum>arr[j]){
                    minimum = arr[j];
                    minimum_index = j;
                }
            }

            temp = arr[i];
            arr[i] = arr[minimum_index];
            arr[minimum_index] = temp;
    }
}
//Selection Sort Function Ends

//Merge Sort

    //Merge Sort Merging Helper
    void merg(double *arr, int l, int m, int r){
        int i,j,k;
        const int n1 = m - l + 1;
        const int n2 = r - m;

        /* create temp arrays */
        double L[n1], R[n2];

         /* Copy data to temp arrays L[] and R[] */
        for (i = 0; i < n1; i++)
            L[i] = arr[l + i];
        for (j = 0; j < n2; j++)
            R[j] = arr[m + 1+ j];

        /* Merge the temp arrays back into arr[l..r]*/
        i = 0; // Initial index of first subarray
        j = 0; // Initial index of second subarray
        k = l; // Initial index of merged subarray
        while (i < n1 && j < n2)
        {
            if (L[i] <= R[j])
            {
                arr[k] = L[i];
                i++;
            }
            else
            {
                arr[k] = R[j];
                j++;
            }
            k++;
        }

        /* Copy the remaining elements of L[], if there
       are any */
        while (i < n1)
        {
            arr[k] = L[i];
            i++;
            k++;
        }

        /* Copy the remaining elements of R[], if there
           are any */
        while (j < n2)
        {
            arr[k] = R[j];
            j++;
            k++;
        }

    }

void mergeSort(double* arr, int low, int high){     //Here high is the last index and not the numberOfElements. if array is x[6], set high = 5.
    if(low<high){
        int mid = low + (high-low)/2;
        mergeSort(arr, low, mid);
        mergeSort(arr, mid+1, high);
        merg(arr, low, mid, high);
    }
}
//Merge Sort Ends

//Binary Search Function
int binarySearch(double* arr, int low, int high, double target){
    int mid = (high + low)/2;
    if(arr[mid] == target)
        return mid;
    if(arr[mid]>target)
        return binarySearch(arr,low,mid-1,target);
    if(arr[mid]<target)
        return binarySearch(arr,mid+1,high,target);
    return -(low+1);
}
//Binary Search Function Ends


int main(){

    double sample_array[6] = {5,3,7,1,3,0};
    //for(int i = 0;i<50;i++)
     //   sample_array[i] = rand()%500;
    cout<<"Unsorted Array: ";
    display(sample_array,6);
    cout<<endl;
    mergeSort(sample_array,0,5);
    cout<<"\nSorted Array: ";
    display(sample_array,6);

    cout<<"Searched 5: Index is: "<<binarySearch(sample_array,0,6,5)<<endl;

}
