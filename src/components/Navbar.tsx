"use client";

import { getServerSession } from "next-auth";
import Link from "next/link";
import Button, { buttonVariants } from "@/ui/Button";
import Icons from "./Icons";
import { useState, useEffect } from "react";
import Image from "next/image";
import Logo from "@/public/Logo1.svg";

// import { useRouter } from "next/router";

interface NavbarProps {
    session?: boolean;
}

const Navbar = ({ session }: NavbarProps) => {
    // const session = await getServerSession();
    const [isOpen, setIsOpen] = useState(false);
    // const session = session;
    // const router = useRouter();

    // useEffect(() => {
    //     setIsOpen(false);
    //     setCurretnUrl(window.location.pathname);
    //     console.log(window.location.pathname);
    // }, [isOpen currentUrl]);

    return (
        <div
            className="fixed backdrop-blur-sm bg-white
            top-0 left-0 right-0 h-20 border-b border-slate-300 
            shadow-sm flex items-center justify-between z-10"
        >
            {/* max-w-7xl */}
            <div className="container mx-auto flex justify-between items-center">
                <Link
                    onClick={() => setIsOpen(false)}
                    href="/"
                    className={buttonVariants({ variant: "none" })}
                >
                    <Image
                        priority
                        src={Logo}
                        height={40}
                        width={40}
                        alt="Logo"
                    />
                    &nbsp;<strong className="text-xl">TOST</strong>
                </Link>

                <div className="hidden md:flex gap-4">
                    {/* <Link
                        href="/documentation"
                        className={buttonVariants({ variant: "ghost" })}
                    >
                        Documentation
                    </Link> */}
                    {session ? (
                        <>
                            <Link
                                onClick={() => setIsOpen(false)}
                                href="/user/menu"
                                className={buttonVariants({
                                    variant: "ghost",
                                })}
                            >
                                Menu
                            </Link>
                            <Link
                                onClick={() => setIsOpen(false)}
                                href="/user/reserve"
                                className={buttonVariants({
                                    variant: "ghost",
                                })}
                            >
                                Reservation
                            </Link>

                            <div className="flex items-center gap-2">
                                <Link
                                    onClick={() => setIsOpen(false)}
                                    href="/user/notification"
                                    className={
                                        buttonVariants({
                                            variant: "ghost",
                                            size: "icon",
                                        }) + " relative"
                                    }
                                >
                                    <Icons.Bell />
                                    <div className="absolute inline-flex items-center justify-center w-6 h-6 text-xs font-bold text-white bg-orange-500 border-2 border-white rounded-full -top-1 -right-1">
                                        0
                                    </div>
                                </Link>
                                <Link
                                    onClick={() => setIsOpen(false)}
                                    href="/user/cart"
                                    className={
                                        buttonVariants({
                                            variant: "ghost",
                                            size: "icon",
                                        }) + " relative"
                                    }
                                >
                                    <Icons.ShoppingCart />
                                    <div className="absolute inline-flex items-center justify-center w-6 h-6 text-xs font-bold text-white bg-red-600 border-2 border-white rounded-full -top-1 -right-1">
                                        1
                                    </div>
                                </Link>

                                <Button
                                    onClick={() => setIsOpen(!isOpen)}
                                    className="ml-2 rounded-full h-10 w-10"
                                >
                                    UI
                                </Button>
                                {isOpen ? (
                                    <div className="absolute top-24 right-18 z-10 bg-white divide-y divide-gray-100 rounded-lg shadow w-44">
                                        <ul className="py-2 text-sm text-gray-700 ">
                                            <li>
                                                <Link
                                                    onClick={() =>
                                                        setIsOpen(false)
                                                    }
                                                    href="/user/profile"
                                                    className="py-2 px-4 flex items-center text-sm text-gray-700 hover:bg-gray-100"
                                                >
                                                    <Icons.User size={16} />
                                                    <span className="pl-2">
                                                        Profile
                                                    </span>
                                                </Link>
                                            </li>
                                            <li>
                                                <Link
                                                    onClick={() =>
                                                        setIsOpen(false)
                                                    }
                                                    href="/user/history"
                                                    className="py-2 px-4 flex items-center text-sm text-gray-700 hover:bg-gray-100"
                                                >
                                                    <Icons.History size={16} />
                                                    <span className="pl-2">
                                                        History
                                                    </span>
                                                </Link>
                                            </li>
                                            {/* <li>
                                                <Link
                                                    onClick={() =>
                                                        setIsOpen(false)
                                                    }
                                                    href="/user/receipt"
                                                    className="py-2 px-4 flex items-center text-sm text-gray-700 hover:bg-gray-100"
                                                >
                                                    <Icons.Receipt size={16} />
                                                    <span className="pl-2">
                                                        Receipt
                                                    </span>
                                                </Link>
                                            </li> */}
                                            {/* <li>
                                                <a
                                                    href="#"
                                                    className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                                                >
                                                    Settings
                                                </a>
                                            </li> */}
                                        </ul>

                                        <Link
                                            onClick={() => setIsOpen(false)}
                                            href="/"
                                            className="py-4 px-4 flex items-center text-sm text-gray-700 hover:bg-gray-100"
                                        >
                                            <Icons.LogOut size={16} />
                                            <span className="pl-2">
                                                Sign Out
                                            </span>
                                        </Link>
                                    </div>
                                ) : (
                                    <></>
                                )}
                            </div>
                            {/* <Button>Sign Out</Button> */}
                            {/* <SignOutButton /> */}
                        </>
                    ) : null}
                </div>
            </div>
        </div>
    );
};

export default Navbar;
